import 'package:bloc/bloc.dart';
import 'package:fashion_flutter/features/categories/data/repo/category_repo.dart';

import '../../../../core/services/locator.dart';
import '../../data/model/category_model.dart';
import 'category_state.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState());
  final CategoryRepoImpl repo = getIt<CategoryRepoImpl>();

  Future<void> fetchCategories() async {
    emit(state.copyWith(isLoading: true));
    var result = await repo.fetchCategories();

    result.fold(
      (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      },
      (res) {
        final List<CategoryModel> categories =
        (res['data'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();

        emit(
          state.copyWith(
            isLoading: false,
            categories: categories,
          ),
        );
      },
    );
  }
}
