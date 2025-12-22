import 'package:dio/dio.dart';
import 'package:fashion_flutter/core/services/local_db_keys.dart';
import 'package:fashion_flutter/core/services/local_service.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio client;
  final LocalDBService localDB;

  AuthInterceptor(this.client, this.localDB);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = localDB.getString(accessTokenKey);
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = localDB.getString(refreshTokenKey);
        print(
          "DEBUG: Starting refresh token process. RefreshToken length: ${refreshToken.length}",
        );

        if (refreshToken.isEmpty) {
          print("DEBUG: Refresh token is empty, skipping refresh.");
          return super.onError(err, handler);
        }

        // Call refresh endpoint
        final refreshDio = Dio(
          BaseOptions(
            baseUrl: client.options.baseUrl,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
        );

        print(
          "DEBUG: Calling refresh endpoint: ${client.options.baseUrl}auth/refresh",
        );
        final response = await refreshDio.post(
          'auth/refresh',
          data: {'refreshToken': refreshToken},
        );

        print("DEBUG: Refresh response status: ${response.statusCode}");
        print("DEBUG: Refresh response data: ${response.data}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Handle both wrapped and unwrapped response
          final data = response.data['data'] ?? response.data;
          final newAccessToken = data['accessToken'];
          final newRefreshToken = data['refreshToken'];

          if (newAccessToken != null && newRefreshToken != null) {
            print("DEBUG: Successfully got new tokens.");
            await localDB.setString(accessTokenKey, newAccessToken);
            await localDB.setString(refreshTokenKey, newRefreshToken);

            // Retry the original request
            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer $newAccessToken';

            print("DEBUG: Retrying original request to: ${options.path}");
            final clonedResponse = await client.fetch(options);
            return handler.resolve(clonedResponse);
          } else {
            print("DEBUG: Tokens not found in refresh response.");
          }
        }
      } catch (e) {
        print("DEBUG: Error during refresh token process: $e");
        if (e is DioException) {
          print("DEBUG: DioException details: ${e.response?.data}");
        }

        // If refresh fails, clear tokens
        await localDB.remove(accessTokenKey);
        await localDB.remove(refreshTokenKey);
      }
    }
    return super.onError(err, handler);
  }
}
