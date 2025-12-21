part of 'discover_cubit.dart';

class DiscoverState {
  final List<ProductModel> products;
  final bool isLoading;
  final String? error;
  final int totalPages;
  final List<String> searches;

  DiscoverState({
    this.products = const [],
    this.searches = const [],
    this.isLoading = false,
    this.error,
    this.totalPages = 1,
  });

  DiscoverState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    String? error,
    int? totalPages,
    List<String>? searches,
  }) {
    return DiscoverState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      totalPages: totalPages ?? this.totalPages,
      searches: searches ?? this.searches,
    );
  }
}
