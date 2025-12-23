import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/features/cart/data/repo/cart_repo.dart';
import 'package:fashion_flutter/features/product_details/data/models/product_details_model.dart';
import 'package:fashion_flutter/features/product_details/data/repo/product_details_repo.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/locator.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsState.initial());

  final ProductDetailsRepoImpl repo = getIt<ProductDetailsRepoImpl>();
  final CartRepoImpl cartRepo = getIt<CartRepoImpl>();

  // Fetch product details
  Future<void> fetchProductDetails({required String id}) async {
    emit(state.copyWith(isLoading: true, error: null));

    final Either result = await repo.fetchProductDetails(id: id);

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.toString()));
      },
      (response) {
        final productModel = ProductDetailsModel.fromJson(response);
        emit(
          state.copyWith(
            isLoading: false,
            productDetailsModel: productModel,
            // Auto-select first size and color
            selectedSizeId: productModel.data.sizes.isNotEmpty
                ? productModel.data.sizes.first.id
                : null,
            selectedColorId: productModel.data.colors.isNotEmpty
                ? productModel.data.colors.first.id
                : null,
          ),
        );
      },
    );
  }

  // Select size
  void selectSize(String sizeId) {
    emit(state.copyWith(selectedSizeId: sizeId));
  }

  // Select color
  void selectColor(String colorId) {
    emit(state.copyWith(selectedColorId: colorId));
  }

  // Check if selected variant has stock
  int getSelectedVariantStock() {
    if (state.productDetailsModel == null ||
        state.selectedSizeId == null ||
        state.selectedColorId == null) {
      return 0;
    }

    final variants = state.productDetailsModel!.data.variants;

    for (var variant in variants) {
      if (variant.sizeId == state.selectedSizeId &&
          variant.colorId == state.selectedColorId) {
        return variant.stock;
      }
    }

    return 0;
  }

  void selectBackgroundImage({required int selectedIndex}) {
    emit(state.copyWith(selectedImageIndex: selectedIndex));
  }

  // Check if a specific size has any available variants with current color
  bool isSizeAvailable(String sizeId) {
    if (state.productDetailsModel == null || state.selectedColorId == null) {
      return false;
    }

    final variants = state.productDetailsModel!.data.variants;

    for (var variant in variants) {
      if (variant.sizeId == sizeId &&
          variant.colorId == state.selectedColorId &&
          variant.stock > 0) {
        return true;
      }
    }

    return false;
  }

  // Check if a specific color has any available variants with current size
  bool isColorAvailable(String colorId) {
    if (state.productDetailsModel == null || state.selectedSizeId == null) {
      return false;
    }

    final variants = state.productDetailsModel!.data.variants;

    for (var variant in variants) {
      if (variant.colorId == colorId &&
          variant.sizeId == state.selectedSizeId &&
          variant.stock > 0) {
        return true;
      }
    }

    return false;
  }

  // Toggle favorite
  Future<void> toggleFavorite() async {
    if (state.productDetailsModel == null) return;

    // Show loading state
    emit(state.copyWith(isTogglingFavorite: true));

    final Either result = await repo.toggleWishlist(
      productId: state.productDetailsModel!.data.id,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isTogglingFavorite: false));
      },
      (response) {
        // Update the inFavourite status
        final updatedProduct = ProductDetailsModel(
          success: state.productDetailsModel!.success,
          data: ProductData(
            id: state.productDetailsModel!.data.id,
            name: state.productDetailsModel!.data.name,
            description: state.productDetailsModel!.data.description,
            images: state.productDetailsModel!.data.images,
            price: state.productDetailsModel!.data.price,
            finalPrice: state.productDetailsModel!.data.finalPrice,
            rate: state.productDetailsModel!.data.rate,
            currency: state.productDetailsModel!.data.currency,
            offerApplied: state.productDetailsModel!.data.offerApplied,
            sizes: state.productDetailsModel!.data.sizes,
            colors: state.productDetailsModel!.data.colors,
            category: state.productDetailsModel!.data.category,
            subCategory: state.productDetailsModel!.data.subCategory,
            variants: state.productDetailsModel!.data.variants,
            isActive: state.productDetailsModel!.data.isActive,
            createdAt: state.productDetailsModel!.data.createdAt,
            updatedAt: state.productDetailsModel!.data.updatedAt,
            inCart: state.productDetailsModel!.data.inCart,
            quantity: state.productDetailsModel!.data.quantity,
            inFavourite: !state.productDetailsModel!.data.inFavourite,
          ),
        );
        emit(
          state.copyWith(
            isTogglingFavorite: false,
            productDetailsModel: updatedProduct,
          ),
        );
      },
    );
  }

  // Get current cart item index if exists
  // Deprecated: No longer needed since backend handles add/update automatically
  // Keep for reference but can be removed later
  /*
  Future<int?> _getCartItemIndex() async {
    if (state.selectedSizeId == null || state.selectedColorId == null) {
      return null;
    }

    final Either result = await cartRepo.getCart();

    return result.fold((failure) => null, (response) {
      final cart = CartModel.fromJson(response);
      final items = cart.data.items;

      for (int i = 0; i < items.length; i++) {
        if (items[i].productId == state.productDetailsModel!.data.id &&
            items[i].sizeId == state.selectedSizeId &&
            items[i].colorId == state.selectedColorId) {
          return i;
        }
      }
      return null;
    });
  }
  */

  // Check if item is in cart
  bool isItemInCart() {
    return getCurrentQuantityInCart() > 0;
  }

  // Get current quantity in cart
  int getCurrentQuantityInCart() {
    if (state.productDetailsModel == null ||
        state.selectedSizeId == null ||
        state.selectedColorId == null) {
      return 0;
    }

    final variants = state.productDetailsModel!.data.variants;

    for (var variant in variants) {
      if (variant.sizeId == state.selectedSizeId &&
          variant.colorId == state.selectedColorId) {
        return variant.inCart;
      }
    }
    return 0;
  }

  // Add or update cart
  // Now uses only addToCart API - backend handles both add and update automatically
  Future<bool> addOrUpdateCart({required int quantity}) async {
    if (state.productDetailsModel == null ||
        state.selectedSizeId == null ||
        state.selectedColorId == null) {
      return false;
    }

    emit(state.copyWith(isAddingToCart: true));

    // Always use addToCart - backend will update if item exists, add if not
    final Either result = await cartRepo.addToCart(
      productId: state.productDetailsModel!.data.id,
      sizeId: state.selectedSizeId!,
      colorId: state.selectedColorId!,
      quantity: quantity,
    );

    return result.fold(
      (failure) {
        emit(state.copyWith(isAddingToCart: false));
        return false;
      },
      (response) {
        // Update the inCart value locally for the selected variant
        final updatedVariants = state.productDetailsModel!.data.variants.map((
          variant,
        ) {
          if (variant.sizeId == state.selectedSizeId &&
              variant.colorId == state.selectedColorId) {
            return VariantModel(
              sizeId: variant.sizeId,
              colorId: variant.colorId,
              stock: variant.stock,
              price: variant.price,
              finalPrice: variant.finalPrice,
              inCart: quantity,
            );
          }
          return variant;
        }).toList();

        final updatedProduct = ProductDetailsModel(
          success: state.productDetailsModel!.success,
          data: ProductData(
            id: state.productDetailsModel!.data.id,
            name: state.productDetailsModel!.data.name,
            description: state.productDetailsModel!.data.description,
            images: state.productDetailsModel!.data.images,
            price: state.productDetailsModel!.data.price,
            finalPrice: state.productDetailsModel!.data.finalPrice,
            rate: state.productDetailsModel!.data.rate,
            currency: state.productDetailsModel!.data.currency,
            offerApplied: state.productDetailsModel!.data.offerApplied,
            sizes: state.productDetailsModel!.data.sizes,
            colors: state.productDetailsModel!.data.colors,
            category: state.productDetailsModel!.data.category,
            subCategory: state.productDetailsModel!.data.subCategory,
            variants: updatedVariants,
            isActive: state.productDetailsModel!.data.isActive,
            createdAt: state.productDetailsModel!.data.createdAt,
            updatedAt: state.productDetailsModel!.data.updatedAt,
            inCart: state.productDetailsModel!.data.inCart,
            quantity: state.productDetailsModel!.data.quantity,
            inFavourite: state.productDetailsModel!.data.inFavourite,
          ),
        );

        emit(
          state.copyWith(
            isAddingToCart: false,
            productDetailsModel: updatedProduct,
          ),
        );
        return true;
      },
    );
  }
}
