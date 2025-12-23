import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';

abstract class WishlistRepo {
  Future<Either> fetchProduct();

  Future<Either> toggleProduct({required String productId});
}

class WishlistRepoImpl implements WishlistRepo {
  final ApiServices api;

  WishlistRepoImpl({required this.api});

  @override
  Future<Either> fetchProduct() {
    return api.request(type: RequestType.get, path: wishlistEP);
  }

  @override
  Future<Either> toggleProduct({required String productId}) {
    return api.request(
      type: RequestType.post,
      path: "$toggleWishlistEP/$productId",
    );
  }
}
