class FilterArgumentModel {
  final String? categoryId;
  final String? subCategoryId;
  final String? productId;
  Map<String, dynamic>? filters;

  FilterArgumentModel({this.categoryId, this.subCategoryId, this.productId}) {
    filters = {
      if (categoryId != null) 'categoryId': categoryId,
      if (subCategoryId != null) 'subCategoryId': subCategoryId,
      if (productId != null) 'productId': productId,
    };
  }
}
