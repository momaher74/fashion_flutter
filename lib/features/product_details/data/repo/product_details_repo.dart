import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';

abstract class ProductDetailsRepo {
  Future<Either> fetchProductDetails({required String id});
  Future<Either> toggleWishlist({required String productId});
}

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ApiServices api;

  ProductDetailsRepoImpl({required this.api});

  @override
  Future<Either> fetchProductDetails({required String id}) {
    return api.request(type: RequestType.get, path: "$productsEP/$id");
  }

  @override
  Future<Either> toggleWishlist({required String productId}) {
    return api.request(
      type: RequestType.post,
      path: "$toggleWishlistEP/$productId",
      withAuth: true,
    );
  }
}
