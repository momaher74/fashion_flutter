import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';

import '../../../../core/enums/request_enum.dart';

import '../../../../core/enums/request_enum.dart';

abstract class AuthRepo {
  Future<Either> login({required Map<String, dynamic> data});

  Future<Either> register({required Map<String, dynamic> data});

  Future<Either> verifySession({required String refreshToken});

  Future<Either> logout();
}

class AuthRepoImp extends AuthRepo {
  final ApiServices api;

  AuthRepoImp(this.api);

  @override
  Future<Either> login({required Map<String, dynamic> data}) {
    return api.request(
      type: RequestType.post,
      path: loginEP,
      data: data,
    );
  }

  @override
  Future<Either> register({required Map<String, dynamic> data}) {
    return api.request(
      type: RequestType.post,
      path: registerEP,
      data: data,
    );
  }

  @override
  Future<Either> verifySession({required String refreshToken}) {
    return api.request(
      type: RequestType.post,
      path: verifySessionEP,
      data: {'refreshToken': refreshToken},
    );
  }

  @override
  Future<Either> logout() {
    return api.request(
      type: RequestType.post,
      path: logoutEP,
      withAuth: true,
    );
  }
}
