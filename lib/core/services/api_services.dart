import 'package:dio/dio.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:get_it/get_it.dart';

class ApiServices {
  final Dio _dio;
  final LocalDBService _localDB;

  ApiServices(this._dio, this._localDB);

  // ============ BASE OPTIONS ============
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://fashion-eta-rosy.vercel.app/api/', // غيرها
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    return dio;
  }

  // ============ AUTH HEADER ============
  Options _authOptions() {
    final token = _localDB.getString('token');

    return Options(
      headers: {
        if (token.isNotEmpty) 'Authorization': 'Bearer $token',
      },
    );
  }

  // ============ GET ============
  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        bool withAuth = false,
      }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: withAuth ? _authOptions() : null,
    );
  }

  // ============ POST ============
  Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        bool withAuth = false,
      }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: withAuth ? _authOptions() : null,
    );
  }

  // ============ PUT ============
  Future<Response> put(
      String path, {
        dynamic data,
        bool withAuth = false,
      }) {
    return _dio.put(
      path,
      data: data,
      options: withAuth ? _authOptions() : null,
    );
  }

  // ============ DELETE ============
  Future<Response> delete(
      String path, {
        dynamic data,
        bool withAuth = false,
      }) {
    return _dio.delete(
      path,
      data: data,
      options: withAuth ? _authOptions() : null,
    );
  }
}
