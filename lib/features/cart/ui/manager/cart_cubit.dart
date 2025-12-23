import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/features/cart/data/models/cart_model.dart';
import 'package:fashion_flutter/features/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/locator.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  final CartRepoImpl cartRepo = getIt<CartRepoImpl>();

  // Fetch cart
  Future<void> fetchCart() async {
    emit(state.copyWith(isLoading: true, error: null));

    final Either result = await cartRepo.getCart();

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.toString()));
      },
      (response) {
        final cartModel = CartModel.fromJson(response);
        emit(state.copyWith(isLoading: false, cartModel: cartModel));
      },
    );
  }

  // Update cart item quantity
  // Now returns full cart response, so we just replace the entire cart
  Future<bool> updateCartItem({
    required String itemId,
    required int quantity,
  }) async {
    emit(state.copyWith(isUpdating: true));

    final Either result = await cartRepo.updateCartItem(
      itemId: itemId,
      quantity: quantity,
    );

    return result.fold(
      (failure) {
        emit(state.copyWith(isUpdating: false, error: failure.toString()));
        return false;
      },
      (response) {
        // Backend returns full updated cart, so we replace it completely
        final updatedCart = CartModel.fromJson(response);
        emit(state.copyWith(isUpdating: false, cartModel: updatedCart));
        return true;
      },
    );
  }

  // Remove item from cart
  // Now returns full cart response, so we just replace the entire cart
  Future<bool> removeFromCart({required String itemId}) async {
    emit(state.copyWith(isUpdating: true));

    final Either result = await cartRepo.removeFromCart(itemId: itemId);

    return result.fold(
      (failure) {
        emit(state.copyWith(isUpdating: false, error: failure.toString()));
        return false;
      },
      (response) {
        // Backend returns full updated cart, so we replace it completely
        final updatedCart = CartModel.fromJson(response);
        emit(state.copyWith(isUpdating: false, cartModel: updatedCart));
        return true;
      },
    );
  }

  // Add to cart
  // Now returns full cart response, so we just replace the entire cart
  Future<bool> addToCart({
    required String productId,
    required String sizeId,
    required String colorId,
    required int quantity,
  }) async {
    emit(state.copyWith(isUpdating: true));

    final Either result = await cartRepo.addToCart(
      productId: productId,
      sizeId: sizeId,
      colorId: colorId,
      quantity: quantity,
    );

    return result.fold(
      (failure) {
        emit(state.copyWith(isUpdating: false, error: failure.toString()));
        return false;
      },
      (response) {
        // Backend returns full updated cart, so we replace it completely
        final updatedCart = CartModel.fromJson(response);
        emit(state.copyWith(isUpdating: false, cartModel: updatedCart));
        return true;
      },
    );
  }

  // Get quantity for a specific item
  int getItemQuantity({
    required String productId,
    required String sizeId,
    required String colorId,
  }) {
    if (state.cartModel == null) return 0;

    final items = state.cartModel!.data.items;
    for (var item in items) {
      if (item.productId == productId &&
          item.sizeId == sizeId &&
          item.colorId == colorId) {
        return item.quantity;
      }
    }
    return 0;
  }

  // Get item id for a specific product/size/color combination
  String? getItemId({
    required String productId,
    required String sizeId,
    required String colorId,
  }) {
    if (state.cartModel == null) return null;

    final items = state.cartModel!.data.items;
    for (var item in items) {
      if (item.productId == productId &&
          item.sizeId == sizeId &&
          item.colorId == colorId) {
        return item.id;
      }
    }
    return null;
  }
}
