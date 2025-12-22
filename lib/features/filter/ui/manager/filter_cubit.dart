import 'package:bloc/bloc.dart';
import 'package:fashion_flutter/core/models/filter_argument_model.dart';
import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/features/filter/data/models/filter_options.dart';
import 'package:fashion_flutter/features/filter/data/repos/filter_repo.dart';

import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());
  final FilterRepoImpl repo = getIt<FilterRepoImpl>();

  // Initialize with filter arguments from previous screen
  void initializeWithArguments(FilterArgumentModel arguments) {
    final queryParams = arguments.toQueryParams();

    emit(
      state.copyWith(
        selectedCategoryIds: List<String>.from(
          queryParams['categoryIds[]'] ?? const [],
        ),
        selectedSubCategoryIds: List<String>.from(
          queryParams['subCategoryIds[]'] ?? const [],
        ),
        selectedOfferIds: List<String>.from(
          queryParams['offerIds[]'] ?? const [],
        ),
        selectedSortBy: queryParams['sortBy'] as String?,
      ),
    );
  }

  Future<void> fetchOptions() async {
    emit(state.copyWith(isLoadOptions: true));
    var r = await repo.fetchFilterOptions();
    r.fold(
      (error) {
        emit(
          state.copyWith(
            isLoadOptions: false,
            optionsErrorMessage: error.toString(),
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            isLoadOptions: false,
            filterOptionsModel: FilterOptionsModel.fromJson(data),
          ),
        );
      },
    );
  }

  Future<void> fetchProducts({bool loadMore = false}) async {
    if (loadMore && !state.hasMoreProducts) return;
    if (loadMore && state.isLoadingMore) return;

    if (loadMore) {
      emit(state.copyWith(isLoadingMore: true));
    } else {
      emit(
        state.copyWith(isLoadProducts: true, currentPage: 1, allProducts: []),
      );
    }

    final queryParams = state.buildQueryParams();
    queryParams['page'] = loadMore ? state.currentPage + 1 : 1;
    queryParams['limit'] = 10; // Adjust as needed

    var r = await repo.fetchProducts(q: queryParams);
    r.fold(
      (error) {
        emit(
          state.copyWith(
            isLoadProducts: false,
            isLoadingMore: false,
            productsErrorMessage: error.toString(),
          ),
        );
      },
      (data) {
        final List<ProductModel> newProducts =
            (data['data']['products'] as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();

        final int total = data['data']['total'] ?? 0;
        final bool hasMore =
            (loadMore ? state.allProducts.length : 0) + newProducts.length <
            total;

        emit(
          state.copyWith(
            isLoadProducts: false,
            isLoadingMore: false,
            allProducts: loadMore
                ? [...state.allProducts, ...newProducts]
                : newProducts,
            currentPage: loadMore ? state.currentPage + 1 : 1,
            totalResults: total,
            hasMoreProducts: hasMore,
          ),
        );
      },
    );
  }

  // Toggle Sort By
  void toggleSortBy(String sortValue) {
    emit(
      state.copyWith(
        selectedSortBy: state.selectedSortBy == sortValue ? null : sortValue,
      ),
    );
  }

  // Toggle Category
  void toggleCategory(String categoryId) {
    final List<String> updated = List.from(state.selectedCategoryIds);
    if (updated.contains(categoryId)) {
      updated.remove(categoryId);
    } else {
      updated.add(categoryId);
    }
    emit(state.copyWith(selectedCategoryIds: updated));
  }

  // Toggle SubCategory
  void toggleSubCategory(String subCategoryId) {
    final List<String> updated = List.from(state.selectedSubCategoryIds);
    if (updated.contains(subCategoryId)) {
      updated.remove(subCategoryId);
    } else {
      updated.add(subCategoryId);
    }
    emit(state.copyWith(selectedSubCategoryIds: updated));
  }

  // Toggle Size
  void toggleSize(String sizeId) {
    final List<String> updated = List.from(state.selectedSizeIds);
    if (updated.contains(sizeId)) {
      updated.remove(sizeId);
    } else {
      updated.add(sizeId);
    }
    emit(state.copyWith(selectedSizeIds: updated));
  }

  // Toggle Color
  void toggleColor(String colorId) {
    final List<String> updated = List.from(state.selectedColorIds);
    if (updated.contains(colorId)) {
      updated.remove(colorId);
    } else {
      updated.add(colorId);
    }
    emit(state.copyWith(selectedColorIds: updated));
  }

  // Toggle Discount/Offer
  void toggleOffer(String offerId) {
    final List<String> updated = List.from(state.selectedOfferIds);
    if (updated.contains(offerId)) {
      updated.remove(offerId);
    } else {
      updated.add(offerId);
    }
    emit(state.copyWith(selectedOfferIds: updated));
  }

  // Set Rating
  void setRating(double? rating) {
    emit(state.copyWith(selectedRating: rating));
  }

  // Set Price Range
  void setPriceRange(double? min, double? max) {
    emit(state.copyWith(minPrice: min, maxPrice: max));
  }

  // Clear all filters
  void clearAllFilters() {
    emit(
      FilterState(
        filterOptionsModel: state.filterOptionsModel,
        isLoadOptions: state.isLoadOptions,
      ),
    );
  }

  // Apply filters and fetch products
  void applyFilters() {
    fetchProducts();
  }
}
