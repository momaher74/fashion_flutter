part of 'product_details_cubit.dart';

@immutable
class ProductDetailsState {
  final String? error;
  final ProductDetailsModel? productDetailsModel;
  final bool isLoading;
  final String? selectedSizeId;
  final String? selectedColorId;
  final bool isAddingToCart;
  final bool isTogglingFavorite;
  final int cartUpdateTrigger; // To trigger FutureBuilder rebuild
  final int selectedImageIndex; // To trigger FutureBuilder rebuild

  const ProductDetailsState({
    this.error,
    this.productDetailsModel,
    this.isLoading = false,
    this.selectedSizeId,
    this.selectedColorId,
    this.isAddingToCart = false,
    this.isTogglingFavorite = false,
    this.cartUpdateTrigger = 0,
    this.selectedImageIndex = 0,
  });

  factory ProductDetailsState.initial() {
    return const ProductDetailsState(
      isLoading: false,
      error: null,
      productDetailsModel: null,
      selectedSizeId: null,
      selectedColorId: null,
      isAddingToCart: false,
      isTogglingFavorite: false,
      cartUpdateTrigger: 0,
      selectedImageIndex: 0,
    );
  }

  ProductDetailsState copyWith({
    String? error,
    ProductDetailsModel? productDetailsModel,
    bool? isLoading,
    String? selectedSizeId,
    String? selectedColorId,
    bool? isAddingToCart,
    bool? isTogglingFavorite,
    int? cartUpdateTrigger,
    int? selectedImageIndex,
  }) {
    return ProductDetailsState(
      error: error,
      productDetailsModel: productDetailsModel ?? this.productDetailsModel,
      isLoading: isLoading ?? this.isLoading,
      selectedSizeId: selectedSizeId ?? this.selectedSizeId,
      selectedColorId: selectedColorId ?? this.selectedColorId,
      isAddingToCart: isAddingToCart ?? this.isAddingToCart,
      isTogglingFavorite: isTogglingFavorite ?? this.isTogglingFavorite,
      cartUpdateTrigger: cartUpdateTrigger ?? this.cartUpdateTrigger,
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
    );
  }
}
