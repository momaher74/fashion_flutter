import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:fashion_flutter/features/product_details/ui/manager/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartButtonWidget extends StatelessWidget {
  const AddToCartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: _buildSwitcherChild(context, cubit, state),
        );
      },
    );
  }

  Widget _buildSwitcherChild(
    BuildContext context,
    ProductDetailsCubit cubit,
    ProductDetailsState state,
  ) {
    // Size or color not selected
    if (state.selectedSizeId == null || state.selectedColorId == null) {
      return _buildNotAvailableMessage(
        key: const ValueKey('not_selected'),
      );
    }

    // Out of stock
    final variantStock = cubit.getSelectedVariantStock();
    if (variantStock <= 0) {
      return _buildNotAvailableMessage(
        key: const ValueKey('out_of_stock'),
      );
    }

    // Loading
    if (state.isAddingToCart) {
      return _buildLoadingState(
        key: const ValueKey('loading'),
      );
    }

    // Cart state
    final currentQuantity = cubit.getCurrentQuantityInCart();

    return currentQuantity > 0
        ? _buildQuantityControl(
            context,
            cubit,
            currentQuantity,
          )
        : _buildAddToCartButton(
            context,
            cubit,
          );
  }

  Widget _buildNotAvailableMessage({required Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.4),
            width: 1.5,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline, color: Colors.grey[700], size: 22),
              const SizedBox(width: 10),
              Text(
                "Not available now",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState({required Key key}) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildQuantityControl(
    BuildContext context,
    ProductDetailsCubit cubit,
    int currentQuantity,
  ) {
    return Padding(
      key: const ValueKey('quantity_control'),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.product.currentQuantity,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                // Decrease
                GestureDetector(
                  onTap: currentQuantity > 1
                      ? () async {
                          await cubit.addOrUpdateCart(
                            quantity: currentQuantity - 1,
                          );
                        }
                      : null,
                  child: _circleButton(
                    icon: Icons.remove,
                    enabled: currentQuantity > 1,
                  ),
                ),

                // Quantity
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    key: ValueKey(currentQuantity),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Text(
                      '$currentQuantity',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Increase
                GestureDetector(
                  onTap: () async {
                    await cubit.addOrUpdateCart(
                      quantity: currentQuantity + 1,
                    );
                  },
                  child: _circleButton(
                    icon: Icons.add,
                    enabled: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCartButton(
    BuildContext context,
    ProductDetailsCubit cubit,
  ) {
    return Padding(
      key: const ValueKey('add_to_cart_button'),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PrimaryButton(
        title: AppLocalizations.product.addToCart,
        onTap: () async {
          await cubit.addOrUpdateCart(quantity: 1);
        },
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required bool enabled,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: enabled ? Colors.black : Colors.grey.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
