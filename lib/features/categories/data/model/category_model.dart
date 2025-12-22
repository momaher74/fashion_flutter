class CategoryModel {
  final String id;
  final String name;
  final MultilingualName nameMultilingual;
  final String image;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<SubCategoryModel> subCategories;

  CategoryModel({
    required this.id,
    required this.name,
    required this.nameMultilingual,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      nameMultilingual:
      MultilingualName.fromJson(json['nameMultilingual']),
      image: json['image'],
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      subCategories: (json['subCategories'] as List<dynamic>)
          .map((e) => SubCategoryModel.fromJson(e))
          .toList(),
    );
  }
}

class SubCategoryModel {
  final String id;
  final String name;
  final MultilingualName nameMultilingual;
  final String categoryId;
  final CategoryRefModel category;
  final String image;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.nameMultilingual,
    required this.categoryId,
    required this.category,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      name: json['name'],
      nameMultilingual:
      MultilingualName.fromJson(json['nameMultilingual']),
      categoryId: json['categoryId'],
      category: CategoryRefModel.fromJson(json['category']),
      image: json['image'],
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
class CategoryRefModel {
  final String id;
  final String name;
  final MultilingualName nameMultilingual;

  CategoryRefModel({
    required this.id,
    required this.name,
    required this.nameMultilingual,
  });

  factory CategoryRefModel.fromJson(Map<String, dynamic> json) {
    return CategoryRefModel(
      id: json['id'],
      name: json['name'],
      nameMultilingual:
      MultilingualName.fromJson(json['nameMultilingual']),
    );
  }
}
class MultilingualName {
  final String ar;
  final String en;

  MultilingualName({
    required this.ar,
    required this.en,
  });

  factory MultilingualName.fromJson(Map<String, dynamic> json) {
    return MultilingualName(
      ar: json['ar'] ?? '',
      en: json['en'] ?? '',
    );
  }
}

