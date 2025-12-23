class CartModel {
  final bool success;
  final CartData data;

  CartModel({required this.success, required this.data});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      success: json['success'] ?? false,
      data: CartData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'data': data.toJson()};
  }
}

class CartData {
  final List<CartItem> items;
  final num total;
  final String currency;

  CartData({required this.items, required this.total, required this.currency});

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: json['total'] ?? 0,
      currency: json['currency'] ?? 'EGP',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'total': total,
      'currency': currency,
    };
  }
}

class CartItem {
  final String id; // Added id field for cart item
  final String productId;
  final CartProduct product;
  final String size;
  final String color;
  final String sizeId;
  final String colorId;
  final int quantity;
  final num subtotal;

  CartItem({
    required this.id,
    required this.productId,
    required this.product,
    required this.size,
    required this.color,
    required this.sizeId,
    required this.colorId,
    required this.quantity,
    required this.subtotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? json['_id'] ?? '', // Support both id and _id
      productId: json['productId'] ?? '',
      product: CartProduct.fromJson(json['product'] ?? {}),
      size: json['size'] ?? '',
      color: json['color'] ?? '',
      sizeId: json['sizeId'] ?? '',
      colorId: json['colorId'] ?? '',
      quantity: json['quantity'] ?? 0,
      subtotal: json['subtotal'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'product': product.toJson(),
      'size': size,
      'color': color,
      'sizeId': sizeId,
      'colorId': colorId,
      'quantity': quantity,
      'subtotal': subtotal,
    };
  }
}

class CartProduct {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final num price;
  final num finalPrice;
  final String currency;
  final CartOfferApplied? offerApplied;
  final bool isActive;

  CartProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.finalPrice,
    required this.currency,
    this.offerApplied,
    required this.isActive,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      price: json['price'] ?? 0,
      finalPrice: json['finalPrice'] ?? 0,
      currency: json['currency'] ?? 'EGP',
      offerApplied: json['offerApplied'] != null
          ? CartOfferApplied.fromJson(json['offerApplied'])
          : null,
      isActive: json['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'price': price,
      'finalPrice': finalPrice,
      'currency': currency,
      'offerApplied': offerApplied?.toJson(),
      'isActive': isActive,
    };
  }
}

class CartOfferApplied {
  final String title;
  final String type;
  final num value;
  final num discount;

  CartOfferApplied({
    required this.title,
    required this.type,
    required this.value,
    required this.discount,
  });

  factory CartOfferApplied.fromJson(Map<String, dynamic> json) {
    return CartOfferApplied(
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      value: json['value'] ?? 0,
      discount: json['discount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'type': type, 'value': value, 'discount': discount};
  }
}
