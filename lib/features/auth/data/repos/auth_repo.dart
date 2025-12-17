import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';
import 'package:fashion_flutter/core/services/error_handler.dart';

abstract class AuthRepo {
  Future<Either> login({required Map<String, dynamic> data});

  Future<Either> register({required Map<String, dynamic> data});
}

class AuthRepoImp extends AuthRepo {
  final ApiServices apiServices;

  AuthRepoImp({required this.apiServices});

  @override
  Future<Either> login({required Map<String, dynamic> data}) async {
    try {
      var response = await apiServices.post(loginEP, data: data);

      return right(response.data);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<Either> register({required Map<String, dynamic> data}) async {
    try {
      var response = await apiServices.post(registerEP, data: data);

      return right(response.data);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
