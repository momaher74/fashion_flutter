class AddToCartResponseModel {
  final bool success;
  final AddToCartData data;

  AddToCartResponseModel({
    required this.success,
    required this.data,
  });

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) {
    return AddToCartResponseModel(
      success: json['success'] ?? false,
      data: AddToCartData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class AddToCartData {
  final String userId;
  final List<AddToCartItem> items;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  AddToCartData({
    required this.userId,
    required this.items,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory AddToCartData.fromJson(Map<String, dynamic> json) {
    return AddToCartData(
      userId: json['userId'] ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => AddToCartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['_id'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'items': items.map((e) => e.toJson()).toList(),
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class AddToCartItem {
  final String productId;
  final String size;
  final String color;
  final int quantity;
  final String id;

  AddToCartItem({
    required this.productId,
    required this.size,
    required this.color,
    required this.quantity,
    required this.id,
  });

  factory AddToCartItem.fromJson(Map<String, dynamic> json) {
    return AddToCartItem(
      productId: json['productId'] ?? '',
      size: json['size'] ?? '',
      color: json['color'] ?? '',
      quantity: json['quantity'] ?? 0,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'size': size,
      'color': color,
      'quantity': quantity,
      '_id': id,
    };
  }
}
