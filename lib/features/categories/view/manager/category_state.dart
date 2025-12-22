
import '../../data/model/category_model.dart';

class CategoryState {
  final String? error;
  final List<CategoryModel> categories;
  final bool isLoading;

  const CategoryState({
    this.error,
    this.categories = const [],
    this.isLoading = false,
  });

  factory CategoryState.initial() => const CategoryState();

  CategoryState copyWith({
    String? error,
    List<CategoryModel>? categories,
    bool? isLoading,
  }) {
    return CategoryState(
      error: error,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

