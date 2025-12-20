import 'package:bloc/bloc.dart';
import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/features/discover/data/repo/discover_repo.dart';

import '../../../../core/services/locator.dart';

part 'discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  DiscoverCubit() : super(DiscoverState());

  final DiscoverRepoImpl repo = getIt<DiscoverRepoImpl>();

  Future<void> search({required Map<String, dynamic> q}) async {
    emit(state.copyWith(isLoading: true));
    print(q);
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
        List<ProductModel> allProduct = [...newProducts, ...state.products];

        emit(state.copyWith(isLoading: false, products: allProduct));
      },
    );
  }
}
