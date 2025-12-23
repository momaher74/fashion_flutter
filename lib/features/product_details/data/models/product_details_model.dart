class ProductDetailsModel {
  final bool success;
  final ProductData data;

  ProductDetailsModel({
    required this.success,
    required this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      success: json['success'],
      data: ProductData.fromJson(json['data']),
    );
  }
}

class ProductData {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final num price;
  final num finalPrice;
  final num rate;
  final String currency;
  final OfferApplied? offerApplied;
  final List<SizeModel> sizes;
  final List<ColorModel> colors;
  final CategoryModel category;
  final SubCategoryModel subCategory;
  final List<VariantModel> variants;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool inCart;
  final int quantity;
  final bool inFavourite;

  ProductData({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.rate,
    required this.finalPrice,
    required this.currency,
    this.offerApplied,
    required this.sizes,
    required this.colors,
    required this.category,
    required this.subCategory,
    required this.variants,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.inCart,
    required this.quantity,
    required this.inFavourite,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      price: json['price'],
      finalPrice: json['finalPrice'],
      currency: json['currency'],
      offerApplied: json['offerApplied'] != null
          ? OfferApplied.fromJson(json['offerApplied'])
          : null,
      sizes: (json['sizes'] as List)
          .map((e) => SizeModel.fromJson(e))
          .toList(),
      colors: (json['colors'] as List)
          .map((e) => ColorModel.fromJson(e))
          .toList(),
      category: CategoryModel.fromJson(json['category']),
      subCategory: SubCategoryModel.fromJson(json['subCategory']),
      variants: (json['variants'] as List)
          .map((e) => VariantModel.fromJson(e))
          .toList(),
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      inCart: json['inCart'],
      quantity: json['quantity'],
      inFavourite: json['inFavourite'], rate: json['rate'] ?? 5,
    );
  }
}

class OfferApplied {
  final String title;
  final String type;
  final num value;
  final num discount;

  OfferApplied({
    required this.title,
    required this.type,
    required this.value,
    required this.discount,
  });

  factory OfferApplied.fromJson(Map<String, dynamic> json) {
    return OfferApplied(
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

class CategoryModel {
  final String id;
  final String name;
  final NameMultilingual nameMultilingual;

  CategoryModel({
    required this.id,
    required this.name,
    required this.nameMultilingual,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      nameMultilingual:
      NameMultilingual.fromJson(json['nameMultilingual']),
    );
  }
}

class SubCategoryModel {
  final String id;
  final String name;
  final NameMultilingual nameMultilingual;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.nameMultilingual,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      name: json['name'],
      nameMultilingual:
      NameMultilingual.fromJson(json['nameMultilingual']),
    );
  }
}

class NameMultilingual {
  final String ar;
  final String en;

  NameMultilingual({
    required this.ar,
    required this.en,
  });

  factory NameMultilingual.fromJson(Map<String, dynamic> json) {
    return NameMultilingual(
      ar: json['ar'],
      en: json['en'],
    );
  }
}

class VariantModel {
  final String sizeId;
  final String colorId;
  final int stock;
  final num price;
  final num finalPrice;
  final int inCart;

  VariantModel({
    required this.sizeId,
    required this.colorId,
    required this.stock,
    required this.price,
    required this.finalPrice,
    required this.inCart,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      sizeId: json['sizeId'],
      colorId: json['colorId'],
      stock: json['stock'],
      price: json['price'],
      finalPrice: json['finalPrice'],
      inCart: json['inCart'] ?? 0,
    );
  }
}
