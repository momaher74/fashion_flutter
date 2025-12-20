import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';

abstract class HomeRepo {
  Future<Either> getHome();
}

class HomeRepoImpl extends HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});

  @override
  Future<Either> getHome() {
    return apiServices.request(type: RequestType.get, path: homeEP);
  }
}
