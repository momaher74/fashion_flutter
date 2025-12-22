import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';

import '../../../../core/services/endpoints.dart';

abstract class CategoryRepo {
  Future<Either> fetchCategories();
}

class CategoryRepoImpl implements CategoryRepo {
  final ApiServices api;

  CategoryRepoImpl({required this.api});

  @override
  Future<Either> fetchCategories() {
    return api.request(type: RequestType.get, path: categoryEP);
  }
}
