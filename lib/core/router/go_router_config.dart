import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/features/addresses/ui/create_address_view.dart';
import 'package:fashion_flutter/features/addresses/ui/get_addresses_view.dart';
import 'package:fashion_flutter/features/addresses/ui/update_address_view.dart';
import 'package:fashion_flutter/features/layout/ui/view/layout_view.dart';
import 'package:fashion_flutter/features/orders/data/models/order_model.dart';
import 'package:fashion_flutter/features/orders/ui/order_details_view.dart';
import 'package:fashion_flutter/features/orders/ui/rate_order_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/splash_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: splashView,
      name: splashView,
      builder: (context, state) => const SplashView(),
    ),

    GoRoute(
      path: layoutView,
      name: layoutView,
      builder: (context, state) => const LayoutView(),
    ),

    GoRoute(
      path: myAddressesView,
      name: myAddressesView,
      builder: (context, state) => const MyAddressesView(),
    ),

    GoRoute(
      path: editAddressView,
      name: editAddressView,
      builder: (context, state) =>
          EditAddressView(addressModel: addresses.first),
    ),

    GoRoute(
      path: addAddressView,
      name: addAddressView,
      builder: (context, state) => AddAddressView(),
    ),

    GoRoute(
      path: rateOrderView,
      name: rateOrderView,
      builder: (context, state) => RateOrderView(),
    ),

    GoRoute(
      path: orderDetailsView,
      name: orderDetailsView,
      builder: (context, state) {
        OrderModel order = state.extra as OrderModel;

        return OrderDetailsView(order: order);
      },
    ),
  ],
);
