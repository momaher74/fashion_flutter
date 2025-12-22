
import 'package:fashion_flutter/features/cart/ui/cart_view.dart';
import 'package:fashion_flutter/features/discover/ui/manager/discover_cubit.dart';
import 'package:fashion_flutter/features/discover/ui/view/discover_view.dart';
import 'package:fashion_flutter/features/home/ui/manager/home_cubit.dart';
import 'package:fashion_flutter/features/home/ui/view/home_view.dart';
import 'package:fashion_flutter/features/wishlist/ui/view/whishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/services/locator.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int i = 0;

  final List<Widget> screens = [
    BlocProvider<HomeCubit>.value(
      value: getIt<HomeCubit>(),
      child: HomeView(),
    ),
    BlocProvider<DiscoverCubit>(
      create: (BuildContext context) => DiscoverCubit(),
      child: DiscoverView(),
    ),
    CartView(),
    WishlistView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[i],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: GNav(
              selectedIndex: i,
              onTabChange: (index) {
                setState(() => i = index);
              },
              gap: 8,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              activeColor: Colors.white,
              color: Colors.grey,
              tabBackgroundColor: Colors.black,

              tabs: const [
                GButton(icon: Icons.home_filled, text: 'Home'),
                GButton(icon: Icons.search, text: 'Discover'),
                GButton(icon: Icons.shopping_cart, text: 'Cart'),

                GButton(icon: Icons.favorite, text: 'Wishlist'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
