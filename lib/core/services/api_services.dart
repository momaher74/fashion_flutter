import 'package:dio/dio.dart';
import 'package:fashion_flutter/core/services/auth_interceptor.dart';
import 'package:fashion_flutter/core/services/local_db_keys.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:dartz/dartz.dart';

import '../enums/request_enum.dart';
import 'error_handler.dart';

class ApiServices {
  final Dio _dio;
  final LocalDBService _localDB;

  ApiServices(this._dio, this._localDB) {
    _dio.interceptors.add(AuthInterceptor(_dio, _localDB));
  }

  // ============ BASE OPTIONS ============
  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://fashion-eta-rosy.vercel.app/api/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Accept': 'application/json'},
      ),
    );
  }

  // ============ AUTH HEADER ============
  Options _authOptions() {
    final token = _localDB.getString(accessTokenKey);

    return Options(
      headers: {if (token.isNotEmpty) 'Authorization': 'Bearer $token'},
    );
  }

  // ============ ONE METHOD TO RULE THEM ALL ============
  Future<Either> request({
    required RequestType type,
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
    bool withAuth = false,
  }) async {
    try {
      late final Response response;

      switch (type) {
        case RequestType.get:
          response = await _dio.get(
            path,
            queryParameters: query,
            options: withAuth ? _authOptions() : null,
          );
          break;

        case RequestType.post:
          response = await _dio.post(
            path,
            data: data,
            queryParameters: query,
            options: withAuth ? _authOptions() : null,
          );
          break;

        case RequestType.put:
          response = await _dio.put(
            path,
            data: data,
            options: withAuth ? _authOptions() : null,
          );
          break;

        case RequestType.delete:
          response = await _dio.delete(
            path,
            data: data,
            options: withAuth ? _authOptions() : null,
          );
          break;
      }

      return right(response.data);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
