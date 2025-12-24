class CheckoutInfoModel {
  final bool success;
  final CheckoutData data;

  CheckoutInfoModel({
    required this.success,
    required this.data,
  });

  factory CheckoutInfoModel.fromJson(Map<String, dynamic> json) {
    return CheckoutInfoModel(
      success: json['success'],
      data: CheckoutData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class CheckoutData {
  final int subtotal;
  final String currency;
  final List<ShippingOption> shippingOptions;
  final List<PaymentMethod> paymentMethods;

  CheckoutData({
    required this.subtotal,
    required this.currency,
    required this.shippingOptions,
    required this.paymentMethods,
  });

  factory CheckoutData.fromJson(Map<String, dynamic> json) {
    return CheckoutData(
      subtotal: json['subtotal'],
      currency: json['currency'],
      shippingOptions: List<ShippingOption>.from(
        json['shippingOptions'].map(
              (x) => ShippingOption.fromJson(x),
        ),
      ),
      paymentMethods: List<PaymentMethod>.from(
        json['paymentMethods'].map(
              (x) => PaymentMethod.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'currency': currency,
      'shippingOptions':
      shippingOptions.map((x) => x.toJson()).toList(),
      'paymentMethods':
      paymentMethods.map((x) => x.toJson()).toList(),
    };
  }
}

class ShippingOption {
  final String type;
  final int price;
  final String label;

  ShippingOption({
    required this.type,
    required this.price,
    required this.label,
  });

  factory ShippingOption.fromJson(Map<String, dynamic> json) {
    return ShippingOption(
      type: json['type'],
      price: json['price'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
      'label': label,
    };
  }
}

class PaymentMethod {
  final String type;
  final String label;

  PaymentMethod({
    required this.type,
    required this.label,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      type: json['type'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'label': label,
    };
  }
}
