import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/setting/ui/view/widgets/setting_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: verticalSpace,
        children: [
          headerGap(),
          ShoppingAppBar(title: "Setting"),
        Gap(10) ,

        SettingItemWidget(text: "Language", iconData: PhosphorIcons.globe(), onTap: () {  },),
        SettingItemWidget(text: "Notification", iconData: PhosphorIcons.bell(), onTap: () {  },),
        SettingItemWidget(text: "Terms of Use", iconData: PhosphorIcons.list(), onTap: () {  },),
        SettingItemWidget(text: "Privacy Policy", iconData: PhosphorIcons.info(), onTap: () {  },),
        SettingItemWidget(text: "Addresses", iconData: PhosphorIcons.mapPinSimpleArea(), onTap: () {  },),
        ],
      ),
    );
  }
}
