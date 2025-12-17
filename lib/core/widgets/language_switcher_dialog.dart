import 'package:easy_localization/easy_localization.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class LanguageSwitcherDialog extends StatelessWidget {
  const LanguageSwitcherDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomText(
              'Select Language',
              fontSize: size20,
              fontWeight: bold,
            ),
            const SizedBox(height: 20),

            // English Option
            _LanguageOption(
              languageName: 'English',
              languageCode: 'en',
              flag: '🇺🇸',
              isSelected: currentLocale.languageCode == 'en',
              onTap: () async {
                await context.setLocale(const Locale('en'));
                await getIt<LocalDBService>().setString(langKey, 'en');
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),

            const SizedBox(height: 12),

            // Arabic Option
            _LanguageOption(
              languageName: 'العربية',
              languageCode: 'ar',
              flag: '🇸🇦',
              isSelected: currentLocale.languageCode == 'ar',
              onTap: () async {
                await context.setLocale(const Locale('ar'));
                await getIt<LocalDBService>().setString(langKey, 'ar');
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String languageName;
  final String languageCode;
  final String flag;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.languageName,
    required this.languageCode,
    required this.flag,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 32)),
            const SizedBox(width: 16),
            Expanded(
              child: CustomText(
                languageName,
                fontSize: size16,
                fontWeight: isSelected ? bold : normal,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
