import 'package:fashion_flutter/features/setting/ui/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/ui/view/change_password_view.dart';
import '../../features/auth/ui/view/forget_password_view.dart';
import '../../features/auth/ui/view/login_view.dart';
import '../../features/auth/ui/view/otp_view.dart';
import '../../features/auth/ui/view/register_view.dart';
import '../../features/auth/ui/view/reset_view.dart';
import '../../features/notification/ui/view/notification_view.dart';
import 'routes_names.dart';
import '../../features/splash/splash_view.dart';
import '../../features/layout/ui/view/layout_view.dart';
import '../../features/addresses/ui/get_addresses_view.dart';
import '../../features/addresses/ui/create_address_view.dart';
import '../../features/addresses/ui/update_address_view.dart';
import '../../features/orders/ui/orders_view.dart';
import '../../features/orders/ui/order_details_view.dart';
import '../../features/orders/ui/rate_order_view.dart';
import '../../features/checkout/ui/order_placed_view.dart';
import '../../features/orders/data/models/order_model.dart';
import '../../core/services/constants.dart';

/// ----------------------
/// Shared Page Transition
/// ----------------------
CustomTransitionPage<T> _fadeSlidePage<T>({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slideAnimation = Tween<Offset>(
        begin: const Offset(0, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.fastEaseInToSlowEaseOut,
        ),
      );

      final fadeAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation);

      return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: slideAnimation,
          child: child,
        ),
      );
    },
  );
}

/// --------
/// GoRouter
/// --------
final GoRouter router = GoRouter(
  initialLocation: splashView,
  routes: [
    /// Splash
    GoRoute(
      path: splashView,
      name: splashView,
      pageBuilder: (context, state) =>
          _fadeSlidePage(state: state, child: const LoginView()),
    ),

    /// Layout
    GoRoute(
      path: layoutView,
      name: layoutView,
      pageBuilder: (context, state) =>
          _fadeSlidePage(state: state, child: const LayoutView()),
    ),

    /// Addresses
    GoRoute(
      path: myAddressesView,
      name: myAddressesView,
      pageBuilder: (context, state) =>
          _fadeSlidePage(state: state, child: const MyAddressesView()),
    ),

    GoRoute(
      path: addAddressView,
      name: addAddressView,
      pageBuilder: (context, state) =>
          _fadeSlidePage(state: state, child: const AddAddressView()),
    ),

    GoRoute(
      path: editAddressView,
      name: editAddressView,
      pageBuilder: (context, state) =>
          _fadeSlidePage(
            state: state,
            child: EditAddressView(addressModel: addresses.first),
          ),
    ),

    /// Orders
    GoRoute(
      path: ordersView,
      name: ordersView,
      pageBuilder: (context, state) =>
          _fadeSlidePage(state: state, child: const OrdersView()),
    ),

    GoRoute(
      path: orderDetailsView,
      name: orderDetailsView,
      pageBuilder: (context, state) {
        final order = state.extra as OrderModel;
        return _fadeSlidePage(
          state: state,
          child: OrderDetailsView(order: order),
        );
      },
    ),

    GoRoute(
      path: rateOrderView,
      name: rateOrderView,
      pageBuilder: (context, state) =>
          _fadeSlidePage(state: state, child: const RateOrderView()),
    ),

    /// Checkout
    GoRoute(
      path: orderPlacedView,
      name: orderPlacedView,
      pageBuilder: (context, state) =>
          _fadeSlidePage(state: state, child: const OrderPlacedView()),
    ),
  ],
);
