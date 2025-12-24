import 'package:bloc/bloc.dart';
import 'package:fashion_flutter/features/checkout/data/models/checkout_info.dart';
import 'package:fashion_flutter/features/checkout/data/repos/checkout_repos.dart';

import '../../../../core/services/locator.dart';
import 'checkout_info_state.dart';

class CheckoutInfoCubit extends Cubit<CheckoutInfoState> {
  CheckoutInfoCubit() : super(CheckoutInfoState()) {
    fetchCheckoutInfo();
  }

  void selectShipping(int index) {
    // 1. Get the price of the specific shipping option selected by the user
    final selectedPrice =
        state.checkoutInfoModel!.data.shippingOptions[index].price;

    // 2. Calculate total using the selected price
    int total = state.checkoutInfoModel!.data.subtotal + selectedPrice;

    print("======== Selected Index: $index, New Total: $total");

    // 3. Emit the new state (Fixed the missing ')' here)
    emit(state.copyWith(selectedShippingIndex: index, total: total));
  }

  void selectPayment(int index) {
    emit(state.copyWith(selectedPaymentIndex: index));
  }

  final CheckoutInfoRepoImpl repo = getIt<CheckoutInfoRepoImpl>();

  Future<void> fetchCheckoutInfo() async {
    emit(state.copyWith(isLoading: true));
    var result = await repo.fetchCheckoutInfo();

    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error.toString()));
      },
      (r) {
        final CheckoutInfoModel model = CheckoutInfoModel.fromJson(r);
        emit(
          state.copyWith(
            isLoading: false,
            checkoutInfoModel: model,
            total:
                (model.data.subtotal + model.data.shippingOptions.first.price),
          ),
        );
      },
    );
  }
}
