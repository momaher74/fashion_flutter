import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // User Profile Section
            const Gap(40),

            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    PhosphorIcons.user(PhosphorIconsStyle.bold),
                    size: 30,
                    color: Colors.grey[600],
                  ),
                ),
                const Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText("Welcome Back!", fontSize: 16, fontWeight: bold),
                    const Gap(5),
                    CustomText(
                      "user@email.com",
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(80),

            // Menu Items
            _DrawerMenuItem(
              icon: PhosphorIcons.houseLine(PhosphorIconsStyle.bold),
              title: "Home",
              onTap: () {},
            ),
            _DrawerMenuItem(
              icon: PhosphorIcons.bag(PhosphorIconsStyle.bold),
              title: "Orders",
              onTap: () {},
            ),
            _DrawerMenuItem(
              icon: PhosphorIcons.heart(PhosphorIconsStyle.bold),
              title: "Wishlist",
              onTap: () {},
            ),

            _DrawerMenuItem(
              icon: PhosphorIcons.bell(PhosphorIconsStyle.bold),
              title: "Notifications",
              onTap: () {},
            ),
            _DrawerMenuItem(
              icon: PhosphorIcons.mapPin(PhosphorIconsStyle.bold),
              title: "Addresses",
              onTap: () {},
            ),
            _DrawerMenuItem(
              icon: PhosphorIcons.user(PhosphorIconsStyle.bold),
              title: "Profile",
              onTap: () {},
            ),
            _DrawerMenuItem(
              icon: PhosphorIcons.gear(PhosphorIconsStyle.bold),
              title: "Settings",
              onTap: () {},
            ),

            // const Spacer(),
            //
            // // Logout Button
            // _DrawerMenuItem(
            //   icon: PhosphorIcons.signOut(PhosphorIconsStyle.bold),
            //   title: "Logout",
            //   onTap: () {},
            //   isLogout: true,
            // ),
            // const Gap(40),
          ],
        ),
      ),
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const _DrawerMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(icon, size: 24, color: isLogout ? Colors.red : Colors.black),
            const Gap(20),
            CustomText(
              title,
              fontSize: 13,
              fontWeight: bold,
              color: isLogout ? Colors.red : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
