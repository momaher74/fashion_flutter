part of 'cart_cubit.dart';

@immutable
class CartState {
  final bool isLoading;
  final bool isUpdating;
  final String? error;
  final CartModel? cartModel;

  const CartState({
    required this.isLoading,
    required this.isUpdating,
    this.error,
    this.cartModel,
  });

  factory CartState.initial() {
    return const CartState(
      isLoading: false,
      isUpdating: false,
      error: null,
      cartModel: null,
    );
  }

  CartState copyWith({
    bool? isLoading,
    bool? isUpdating,
    String? error,
    CartModel? cartModel,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      error: error,
      cartModel: cartModel ?? this.cartModel,
    );
  }

  bool get hasItems => cartModel?.data.items.isNotEmpty ?? false;

  int get itemCount => cartModel?.data.items.length ?? 0;

  num get total => cartModel?.data.total ?? 0;

  String get currency => cartModel?.data.currency ?? 'EGP';
}
