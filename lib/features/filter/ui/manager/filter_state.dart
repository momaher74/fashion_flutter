import 'package:flutter/foundation.dart';
import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/features/filter/data/models/filter_options.dart';

@immutable
class FilterState {
  final String? productsErrorMessage;
  final String? optionsErrorMessage;
  final FilterOptionsModel? filterOptionsModel;
  final List<ProductModel> allProducts;
  final bool isLoadProducts;
  final bool isLoadOptions;
  final bool isLoadingMore;
  final bool hasMoreProducts;
  final int currentPage;
  final int totalResults;

  // Selected filter values
  final String? selectedSortBy;
  final List<String> selectedCategoryIds;
  final List<String> selectedSubCategoryIds;
  final List<String> selectedSizeIds;
  final List<String> selectedColorIds;
  final List<String> selectedOfferIds;
  final double? selectedRating;
  final double? minPrice;
  final double? maxPrice;

  const FilterState({
    this.productsErrorMessage,
    this.optionsErrorMessage,
    this.filterOptionsModel,
    this.allProducts = const [],
    this.isLoadProducts = false,
    this.isLoadOptions = false,
    this.isLoadingMore = false,
    this.hasMoreProducts = true,
    this.currentPage = 1,
    this.totalResults = 0,
    this.selectedSortBy,
    this.selectedCategoryIds = const [],
    this.selectedSubCategoryIds = const [],
    this.selectedSizeIds = const [],
    this.selectedColorIds = const [],
    this.selectedOfferIds = const [],
    this.selectedRating,
    this.minPrice,
    this.maxPrice,
  });

  FilterState copyWith({
    String? productsErrorMessage,
    String? optionsErrorMessage,
    FilterOptionsModel? filterOptionsModel,
    List<ProductModel>? allProducts,
    bool? isLoadProducts,
    bool? isLoadOptions,
    bool? isLoadingMore,
    bool? hasMoreProducts,
    int? currentPage,
    int? totalResults,
    String? selectedSortBy,
    String? productId,
    List<String>? selectedCategoryIds,
    List<String>? selectedSubCategoryIds,
    List<String>? selectedSizeIds,
    List<String>? selectedColorIds,
    List<String>? selectedOfferIds,
    double? selectedRating,
    double? minPrice,
    double? maxPrice,
  }) {
    return FilterState(
      productsErrorMessage: productsErrorMessage ?? this.productsErrorMessage,
      optionsErrorMessage: optionsErrorMessage ?? this.optionsErrorMessage,
      filterOptionsModel: filterOptionsModel ?? this.filterOptionsModel,
      allProducts: allProducts ?? this.allProducts,
      isLoadProducts: isLoadProducts ?? this.isLoadProducts,
      isLoadOptions: isLoadOptions ?? this.isLoadOptions,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMoreProducts: hasMoreProducts ?? this.hasMoreProducts,
      currentPage: currentPage ?? this.currentPage,
      totalResults: totalResults ?? this.totalResults,
      selectedSortBy: selectedSortBy ?? this.selectedSortBy,
      selectedCategoryIds: selectedCategoryIds ?? this.selectedCategoryIds,
      selectedSubCategoryIds:
          selectedSubCategoryIds ?? this.selectedSubCategoryIds,
      selectedSizeIds: selectedSizeIds ?? this.selectedSizeIds,
      selectedColorIds: selectedColorIds ?? this.selectedColorIds,
      selectedOfferIds: selectedOfferIds ?? this.selectedOfferIds,
      selectedRating: selectedRating ?? this.selectedRating,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }

  Map<String, dynamic> buildQueryParams() {
    final Map<String, dynamic> params = {};

    if (selectedSortBy != null) params['sortBy'] = selectedSortBy;
    if (selectedCategoryIds.isNotEmpty) {
      params['categoryIds[]'] = selectedCategoryIds;
    }
    if (selectedSubCategoryIds.isNotEmpty) {
      params['subCategoryIds[]'] = selectedSubCategoryIds;
    }
    if (selectedSizeIds.isNotEmpty) {
      params['sizes[]'] = selectedSizeIds;
    }
    if (selectedColorIds.isNotEmpty) {
      params['colors[]'] = selectedColorIds;
    }
    if (selectedOfferIds.isNotEmpty) {
      params['offerIds[]'] = selectedOfferIds;
    }
    if (selectedRating != null) params['rating'] = selectedRating;
    if (minPrice != null) params['minPrice'] = minPrice;
    if (maxPrice != null) params['maxPrice'] = maxPrice;

    return params;
  }
}
