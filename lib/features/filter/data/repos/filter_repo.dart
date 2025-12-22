import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';

abstract class FilterRepo {
  Future<Either> fetchProducts({required Map<String, dynamic> q});

  Future<Either> fetchFilterOptions();
}

class FilterRepoImpl implements FilterRepo {
  final ApiServices api;

  FilterRepoImpl({required this.api});

  @override
  Future<Either> fetchProducts({required Map<String, dynamic> q}) async {
    return api.request(type: RequestType.get, path: productsEP, query: q);
  }

  @override
  Future<Either> fetchFilterOptions() async {
    return api.request(type: RequestType.get, path: filterEP);
  }
}
