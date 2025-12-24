import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/core/widgets/custome_error_widget.dart';
import 'package:fashion_flutter/features/addresses/data/model/address_model.dart';
import 'package:fashion_flutter/features/checkout/ui/manager/checkout_info_cubit.dart';
import 'package:fashion_flutter/features/checkout/ui/widget/address_card_widget.dart';
import 'package:fashion_flutter/features/checkout/ui/widget/secation_able_tile.dart';
import 'package:fashion_flutter/features/checkout/ui/widget/secation_tile.dart';
import 'package:fashion_flutter/features/checkout/ui/widget/summary_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/checkout_info_state.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({
    super.key,
    required this.addressModel,
  });

  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckoutInfoCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Checkout',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: BlocBuilder<CheckoutInfoCubit, CheckoutInfoState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CustomLoadingWidget(),
              );
            }

            if (state.error != null) {
              return Center(
                child : CustomErrorWidget(message: state.error!),
              );
            }

            final checkout = state.checkoutInfoModel?.data;

            if (checkout == null) {
              return const SizedBox();
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ADDRESS
                  const SectionTitle(title: 'Delivery Address'),
                  AddressCard(addressModel: addressModel),

                  const SizedBox(height: 24),

                  /// SHIPPING
                  const SectionTitle(title: 'Shipping Method'),
                  ...checkout.shippingOptions.asMap().entries.map(
                        (entry) {
                      final index = entry.key;
                      final option = entry.value;

                      return SelectableTile(
                        title: option.label,
                        trailing:
                        '${option.price} ${checkout.currency}',
                        isSelected:
                        state.selectedShippingIndex == index,
                        onTap: () {
                          context
                              .read<CheckoutInfoCubit>()
                              .selectShipping(index);
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  /// PAYMENT
                  const SectionTitle(title: 'Payment Method'),
                  ...checkout.paymentMethods.asMap().entries.map(
                        (entry) {
                      final index = entry.key;
                      final method = entry.value;

                      return SelectableTile(
                        title: method.label,
                        isSelected:
                        state.selectedPaymentIndex == index,
                        onTap: () {
                          context
                              .read<CheckoutInfoCubit>()
                              .selectPayment(index);
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  /// SUMMARY
                  const SectionTitle(title: 'Order Summary'),
                  SummaryTile(
                    title: 'Subtotal',
                    value:
                    '${checkout.subtotal} ${checkout.currency}',
                  ),
                  SummaryTile(
                    title: 'Shipping',
                    value:
                    '${checkout.shippingOptions[state.selectedShippingIndex].price} ${checkout.currency}',
                  ),
                  const Divider(color: Colors.black12),
                  SummaryTile(
                    title: 'Total',
                    value:
                    '${state.total} ${checkout.currency}',
                    isBold: true,
                  ),

                  const SizedBox(height: 28),

                  /// CONFIRM BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // context
                        //     .read<CheckoutInfoCubit>()
                        //     .confirmOrder();
                      },
                      child: const Text(
                        'Confirm Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
