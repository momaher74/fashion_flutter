/* ===================== PRODUCT ===================== */

import '../../features/home/data/models/home_model.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final num price;
  final num finalPrice;
  final num rate;
  final bool isFavourite;
  final String currency;
  final OfferAppliedModel offerApplied;
  final List<SizeModel> sizes;
  final List<ColorModel> colors;
  final CategoryMiniModel category;
  final CategoryMiniModel subCategory;
  final List<VariantModel> variants;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.finalPrice,
    required this.currency,
    required this.offerApplied,
    required this.sizes,
    required this.colors,
    required this.category,
    required this.subCategory,
    required this.variants,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.rate,
    required this.isFavourite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      rate: json['rate'] ?? 5,
      isFavourite: json['inFavourite'] ?? false,
      description: json['description'],
      images: List<String>.from(json['images']),
      price: json['price'],
      finalPrice: json['finalPrice'],
      currency: json['currency'],
      offerApplied: OfferAppliedModel.fromJson(json['offerApplied']),
      sizes: (json['sizes'] as List)
          .map((e) => SizeModel.fromJson(e))
          .toList(),
      colors: (json['colors'] as List)
          .map((e) => ColorModel.fromJson(e))
          .toList(),
      category: CategoryMiniModel.fromJson(json['category']),
      subCategory: CategoryMiniModel.fromJson(json['subCategory']),
      variants: (json['variants'] as List)
          .map((e) => VariantModel.fromJson(e))
          .toList(),
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}


/* ===================== OFFER ===================== */

class OfferModel {
  final String id;
  final String title;
  final String type;
  final String image;
  final String ?productId;
  final String ?categoryId;
  final String ?subCategoryId;
  final num value;
  final String scope;
  final DateTime endDate;

  OfferModel({
    required this.id,
    required this.title,
    required this.type,
     this.productId,
     this.subCategoryId,
     this.categoryId,
    required this.value,
    required this.scope,
    required this.endDate,
    required this.image,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      value: json['value'],
      scope: json['scope'],
      image: json['image'],
      categoryId: json['categoryId'],
      subCategoryId: json['subCategoryId'],
      productId: json['productId'],
      endDate: DateTime.parse(json['endDate']),
    );
  }
}

/* ===================== STORY ===================== */


/* ===================== HELPERS ===================== */

class MultilingualModel {
  final String ar;
  final String en;

  MultilingualModel({
    required this.ar,
    required this.en,
  });

  factory MultilingualModel.fromJson(Map<String, dynamic> json) {
    return MultilingualModel(
      ar: json['ar'],
      en: json['en'],
    );
  }
}
class StoryModel {
  final String id;
  final String title;
  final MultilingualModel titleMultilingual;
  final String mediaUrl;
  final String mediaType;
  final String categoryId;
  final bool seen;
  final DateTime createdAt;

  StoryModel({
    required this.id,
    required this.title,
    required this.titleMultilingual,
    required this.mediaUrl,
    required this.mediaType,
    required this.categoryId,
    required this.seen,
    required this.createdAt,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      title: json['title'],
      titleMultilingual:
      MultilingualModel.fromJson(json['titleMultilingual']),
      mediaUrl: json['mediaUrl'],
      mediaType: json['mediaType'],
      categoryId: json['categoryId'],
      seen: json['seen'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

/* ===================== CATEGORY ===================== */

class CategoryModel {
  final String id;
  final String name;
  final MultilingualModel nameMultilingual;
  final String image;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.nameMultilingual,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      nameMultilingual:
      MultilingualModel.fromJson(json['nameMultilingual']),
      image: json['image'],
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

/* ===================== BANNER ===================== */

class BannerModel {
  final String id;
  final String image;
  final String? categoryId;
  final String? subCategoryId;
  final String? productId;
  final String? categoryName;
  final int order;

  BannerModel({
    required this.id,
    required this.image,
    this.categoryId,
    this.categoryName,
    this.productId,
    this.subCategoryId,
    required this.order,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
      categoryId: json['categoryId'],
      subCategoryId: json['subCategoryId'],
      productId: json['productId'],
      categoryName: json['categoryName'],
      order: json['order'],
    );
  }
}

