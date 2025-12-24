import '../../data/models/checkout_info.dart';

class CheckoutInfoState {
  final bool isLoading;
  final String? error;
  final CheckoutInfoModel? checkoutInfoModel;
  final int selectedShippingIndex;
  final int selectedPaymentIndex;
  final int total ;

  CheckoutInfoState({
    this.isLoading = false,
    this.error,
    this.checkoutInfoModel,
    this.selectedShippingIndex = 0,
    this.total = 0,
    this.selectedPaymentIndex = 0,
  });

  CheckoutInfoState copyWith({
    bool? isLoading,
    String? error,
    CheckoutInfoModel? checkoutInfoModel,
    int? selectedShippingIndex,
    int? selectedPaymentIndex,
    int? total,
  }) {
    return CheckoutInfoState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      checkoutInfoModel: checkoutInfoModel ?? this.checkoutInfoModel,
      selectedShippingIndex:
      selectedShippingIndex ?? this.selectedShippingIndex,
      selectedPaymentIndex:
      selectedPaymentIndex ?? this.selectedPaymentIndex,
      total:  total ?? this.total,
    );
  }
}
