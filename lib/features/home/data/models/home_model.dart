import '../../../../core/models/product_model.dart';

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
      offers: (json['offers'] as List<dynamic>? ?? [])
          .map((e) => OfferModel.fromJson(e))
          .toList(),
      stories: (json['stories'] as List<dynamic>? ?? [])
          .map((e) => StoryModel.fromJson(e))
          .toList(),
      categories: (json['categories'] as List<dynamic>? ?? [])
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      banners: (json['banners'] as List<dynamic>? ?? [])
          .map((e) => BannerModel.fromJson(e))
          .toList(),
      popularProducts: (json['popularProducts'] as List<dynamic>? ?? [])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
      recommendedProducts: (json['recommendedProducts'] as List<dynamic>? ?? [])
          .map((e) => ProductModel.fromJson(e))
          .toList(),
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
