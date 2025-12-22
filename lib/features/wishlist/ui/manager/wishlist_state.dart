part of 'wishlist_cubit.dart';


class WishlistState {
  final bool isLoading;
  final String? error;
  final List<ProductModel> products;

  const WishlistState({
    this.isLoading = false,
    this.error,
    this.products = const [],
  });

  WishlistState copyWith({
    bool? isLoading,
    String? error,
    List<ProductModel>? products,
  }) {
    return WishlistState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      products: products ?? this.products,
    );
  }
}
