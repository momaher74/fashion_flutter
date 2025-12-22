class FilterArgumentModel {
  final String? categoryId;
  final String? subCategoryId;
  final String? offerId;
  final String? productId;
  final String? sortBy;
  final String? searchQuery;

  FilterArgumentModel({
    this.categoryId,
    this.subCategoryId,
    this.offerId,
    this.sortBy,
    this.productId,
    this.searchQuery,
  });

  Map<String, dynamic> toQueryParams() {
    return {
      if (categoryId != null) 'categoryIds[]': [categoryId],
      if (subCategoryId != null) 'subCategoryIds[]': [subCategoryId],
      if (offerId != null) 'offerIds[]': [offerId],
      if (sortBy != null) 'sortBy': sortBy,
      if (productId != null) 'productId': productId,
      if (searchQuery != null) 'search': searchQuery,
    };
  }
}
