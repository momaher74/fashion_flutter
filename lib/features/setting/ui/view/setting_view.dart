import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/language_switcher_dialog.dart';
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
          ShoppingAppBar(title: AppLocalizations.settings.settings),
          Gap(10),

          SettingItemWidget(
            text: AppLocalizations.settings.language,
            iconData: PhosphorIcons.globe(),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const LanguageSwitcherDialog(),
              );
            },
          ),
          SettingItemWidget(
            text: AppLocalizations.settings.notification,
            iconData: PhosphorIcons.bell(),
            onTap: () {},
          ),
          SettingItemWidget(
            text: AppLocalizations.settings.termsOfUse,
            iconData: PhosphorIcons.list(),
            onTap: () {},
          ),
          SettingItemWidget(
            text: AppLocalizations.settings.privacyPolicy,
            iconData: PhosphorIcons.info(),
            onTap: () {},
          ),
          SettingItemWidget(
            text: AppLocalizations.settings.addresses,
            iconData: PhosphorIcons.mapPinSimpleArea(),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
