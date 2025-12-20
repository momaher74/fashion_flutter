class HomeModel {
  final bool success;
  final HomeData data;

  HomeModel({
    required this.success,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      success: json['success'],
      data: HomeData.fromJson(json['data']),
    );
  }
}

/* ===================== HOME DATA ===================== */

class HomeData {
  final List<OfferModel> offers;
  final List<StoryModel> stories;
  final List<CategoryModel> categories;
  final List<BannerModel> banners;
  final List<ProductModel> popularProducts;
  final List<ProductModel> recommendedProducts;

  HomeData({
    required this.offers,
    required this.stories,
    required this.categories,
    required this.banners,
    required this.popularProducts,
    required this.recommendedProducts,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return HomeData(
      offers: (json['offers'] as List)
          .map((e) => OfferModel.fromJson(e))
          .toList(),
      stories: (json['stories'] as List)
          .map((e) => StoryModel.fromJson(e))
          .toList(),
      categories: (json['categories'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      banners: (json['banners'] as List)
          .map((e) => BannerModel.fromJson(e))
          .toList(),
      popularProducts: (json['popularProducts'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      recommendedProducts: (json['recommendedProducts'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }
}

/* ===================== OFFER ===================== */

class OfferModel {
  final String id;
  final String title;
  final String type;
  final num value;
  final String scope;
  final DateTime endDate;

  OfferModel({
    required this.id,
    required this.title,
    required this.type,
    required this.value,
    required this.scope,
    required this.endDate,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      value: json['value'],
      scope: json['scope'],
      endDate: DateTime.parse(json['endDate']),
    );
  }
}

/* ===================== STORY ===================== */

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
  final String? categoryName;
  final int order;

  BannerModel({
    required this.id,
    required this.image,
    this.categoryId,
    this.categoryName,
    required this.order,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      order: json['order'],
    );
  }
}

/* ===================== PRODUCT ===================== */

class ProductModel {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final num price;
  final num finalPrice;
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
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
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

class OfferAppliedModel {
  final String title;
  final String type;
  final num value;
  final num discount;

  OfferAppliedModel({
    required this.title,
    required this.type,
    required this.value,
    required this.discount,
  });

  factory OfferAppliedModel.fromJson(Map<String, dynamic> json) {
    return OfferAppliedModel(
      title: json['title'],
      type: json['type'],
      value: json['value'],
      discount: json['discount'],
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

class CategoryMiniModel {
  final String id;
  final String name;
  final MultilingualModel nameMultilingual;

  CategoryMiniModel({
    required this.id,
    required this.name,
    required this.nameMultilingual,
  });

  factory CategoryMiniModel.fromJson(Map<String, dynamic> json) {
    return CategoryMiniModel(
      id: json['id'],
      name: json['name'],
      nameMultilingual:
      MultilingualModel.fromJson(json['nameMultilingual']),
    );
  }
}

class VariantModel {
  final String sizeId;
  final String colorId;
  final int stock;
  final num price;
  final num finalPrice;

  VariantModel({
    required this.sizeId,
    required this.colorId,
    required this.stock,
    required this.price,
    required this.finalPrice,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      sizeId: json['sizeId'],
      colorId: json['colorId'],
      stock: json['stock'],
      price: json['price'],
      finalPrice: json['finalPrice'],
    );
  }
}
