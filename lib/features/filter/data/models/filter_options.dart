class FilterOptionsModel {
  final bool success;
  final FilterOptionsData data;

  FilterOptionsModel({
    required this.success,
    required this.data,
  });

  factory FilterOptionsModel.fromJson(Map<String, dynamic> json) {
    return FilterOptionsModel(
      success: json['success'],
      data: FilterOptionsData.fromJson(json['data']),
    );
  }
}
class FilterOptionsData {
  final List<CategoryModel> categories;
  final List<SubCategoryModel> subCategories;
  final List<SizeModel> sizes;
  final List<ColorModel> colors;
  final List<DiscountModel> discounts;
  final List<SortOptionModel> sortOptions;

  FilterOptionsData({
    required this.categories,
    required this.subCategories,
    required this.sizes,
    required this.colors,
    required this.discounts,
    required this.sortOptions,
  });

  factory FilterOptionsData.fromJson(Map<String, dynamic> json) {
    return FilterOptionsData(
      categories: (json['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),

      subCategories: (json['subCategories'] as List)
          .map((e) => SubCategoryModel.fromJson(e))
          .toList(),

      sizes: (json['sizes'] as List)
          .map((e) => SizeModel.fromJson(e))
          .toList(),

      colors: (json['colors'] as List)
          .map((e) => ColorModel.fromJson(e))
          .toList(),

      discounts: (json['discounts'] as List)
          .map((e) => DiscountModel.fromJson(e))
          .toList(),

      sortOptions: (json['sortOptions'] as List)
          .map((e) => SortOptionModel.fromJson(e))
          .toList(),
    );
  }
}

class CategoryModel {
  final String id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class SubCategoryModel {
  final String id;
  final String name;
  final String categoryId;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.categoryId,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      name: json['name'],
      categoryId: json['categoryId'],
    );
  }
}

class SizeModel {
  final String id;
  final String name;

  SizeModel({
    required this.id,
    required this.name,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ColorModel {
  final String id;
  final String name;
  final String hexCode;

  ColorModel({
    required this.id,
    required this.name,
    required this.hexCode,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['id'],
      name: json['name'],
      hexCode: json['hexCode'],
    );
  }
}

class DiscountModel {
  final String id;
  final String title;
  final int value;
  final String type;

  DiscountModel({
    required this.id,
    required this.title,
    required this.value,
    required this.type,
  });

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
      id: json['id'],
      title: json['title'],
      value: json['value'],
      type: json['type'],
    );
  }
}


class SortOptionModel {
  final String label;
  final String value;

  SortOptionModel({
    required this.label,
    required this.value,
  });

  factory SortOptionModel.fromJson(Map<String, dynamic> json) {
    return SortOptionModel(
      label: json['label'],
      value: json['value'],
    );
  }
}
