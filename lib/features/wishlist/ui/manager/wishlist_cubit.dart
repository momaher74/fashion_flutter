import 'package:bloc/bloc.dart';
import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/features/wishlist/data/repo/wishlist_repo.dart';

import '../../../../core/services/locator.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistState());

  final WishlistRepoImpl repo = getIt<WishlistRepoImpl>();

   Future<void> fetchProducts() async {
    emit(state.copyWith(isLoading: true));
    var result = await repo.fetchProduct();

    result.fold(
      (error) {

        emit(state.copyWith(isLoading: false, error: error.toString()));
      },
      (response) {
        print(response);
        List<ProductModel> wishlist = [];



        response['data'].forEach((item) {
          wishlist.add(ProductModel.fromJson(item));
        });
        emit(state.copyWith(isLoading: false, products: wishlist));
      },
    );
  }
  Future<void> toggle({required String productId})async{
    emit(state.copyWith(isLoading: true));
    print(productId);
    var result = await repo.toggleProduct(productId: productId);

    result.fold(
          (error) {

        emit(state.copyWith(isLoading: false, error: error.toString()));
      },
          (response) {
       fetchProducts();
      },
    );
  }

}
