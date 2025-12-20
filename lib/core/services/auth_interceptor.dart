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

        print("handel refresh token process ${localDB.getString(refreshTokenKey)}");
        final refreshToken = localDB.getString(refreshTokenKey);

        if (refreshToken.isEmpty) {
          return super.onError(err, handler);
        }

        // Call refresh endpoint
        // Use a separate Dio instance to avoid infinite loops
        final refreshDio = Dio(BaseOptions(baseUrl: client.options.baseUrl));
        final response = await refreshDio.post(
          'auth/refresh',
          data: {'refreshToken': refreshToken},
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          final newAccessToken = response.data['accessToken'];
          final newRefreshToken = response.data['refreshToken'];

          await localDB.setString(accessTokenKey, newAccessToken);
          await localDB.setString(refreshTokenKey, newRefreshToken);

          // Retry the original request
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          final clonedResponse = await client.fetch(options);
          return handler.resolve(clonedResponse);
        }
      } catch (e) {
        // If refresh fails, you might want to logout the user
        // For example, by clearing storage and navigating to login
        await localDB.remove(accessTokenKey);
        await localDB.remove(refreshTokenKey);

        // You can also use a GlobalKey<NavigatorState> to redirect to Login
        // or a Stream that the UI listens to.
      }
    }
    return super.onError(err, handler);
  }
}
