import 'package:bloc/bloc.dart';
import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/services/local_db_keys.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:fashion_flutter/features/discover/data/repo/discover_repo.dart';

import '../../../../core/services/locator.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit() : super(DiscoverState());
  LocalDBService localDBService = getIt<LocalDBService>();

  Future<void> getSearches() async {
    List<String> searches = localDBService.getStringList(searchesKey);

    emit(state.copyWith(searches: searches));
  }

  final DiscoverRepoImpl repo = getIt<DiscoverRepoImpl>();

  Future<void> removeSearch(String value) async {
    final updatedList = state.searches.where((e) => e != value).toList();

    await localDBService.setStringList(searchesKey, updatedList);

    emit(state.copyWith(searches: updatedList));
  }

  Future<void> clearAllSearches() async {
    await localDBService.remove(searchesKey);
    emit(state.copyWith(searches: []));
  }

  Future<void> search({
    required Map<String, dynamic> q,
    bool reset = false,
  }) async {
    if (!reset && q['page'] > state.totalPages) {
      // Do not request if we are beyond the last page
      return;
    }

    if (reset) {
      emit(state.copyWith(products: [], isLoading: true, error: null));
    } else {
      emit(state.copyWith(isLoading: true, error: null));
    }

    final String query = q['search'];

    if (query.isNotEmpty && query.length <30) {
      final List<String> updatedSearches = [
        query,
        ...state.searches.where((e) => e != query),
      ];

      await localDBService.setStringList(searchesKey, updatedSearches);

      emit(state.copyWith(searches: updatedSearches));
    }
    var r = await repo.discover(q: q);
    r.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error.toString()));
      },
      (data) {
        List<ProductModel> newProducts = [];
        data['data']['products'].forEach((prod) {
          newProducts.add(ProductModel.fromJson(prod));
        });

        final allProducts = reset
            ? newProducts
            : [...state.products, ...newProducts];

        emit(
          state.copyWith(
            isLoading: false,
            products: allProducts,
            totalPages: data['data']['pages'] ?? 1,
          ),
        );
      },
    );
  }
}
