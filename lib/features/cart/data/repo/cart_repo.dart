import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';

abstract class CartRepo {
  Future<Either> addToCart({
    required String productId,
    required String sizeId,
    required String colorId,
    required int quantity,
  });

  Future<Either> updateCartItem({
    required String itemId,
    required int quantity,
  });

  Future<Either> getCart();

  Future<Either> removeFromCart({required String itemId});
}

class CartRepoImpl implements CartRepo {
  final ApiServices api;

  CartRepoImpl({required this.api});

  @override
  Future<Either> addToCart({
    required String productId,
    required String sizeId,
    required String colorId,
    required int quantity,
  }) {
    return api.request(
      type: RequestType.post,
      path: addToCartEP,
      withAuth: true,
      data: {
        'productId': productId,
        'size': sizeId,
        'color': colorId,
        'quantity': quantity,
      },
    );
  }

  @override
  Future<Either> updateCartItem({
    required String itemId,
    required int quantity,
  }) {
    return api.request(
      type: RequestType.patch,
      path: "$updateCartItemEP/$itemId",
      withAuth: true,
      data: {'quantity': quantity},
    );
  }

  @override
  Future<Either> getCart() {
    return api.request(type: RequestType.get, path: getCartEP, withAuth: true);
  }

  @override
  Future<Either> removeFromCart({required String itemId}) {
    return api.request(
      type: RequestType.delete,
      path: "$updateCartItemEP/$itemId",
      withAuth: true,
    );
  }
}
