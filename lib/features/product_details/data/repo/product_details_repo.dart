import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';

abstract class ProductDetailsRepo {
  Future<Either> fetchProductDetails({required String id});
}

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ApiServices api;

  ProductDetailsRepoImpl({required this.api});

  @override
  Future<Either> fetchProductDetails({required String id}) {
    return api.request(type: RequestType.get, path: "$productsEP/$id");
  }
}
