# Localization Implementation Guide

This document explains how to use the localization system in the Fashion Flutter app.

## Overview

The app now supports **Arabic (ar)** and **English (en)** languages using the `easy_localization` package.

## Features

✅ Complete translation files for both Arabic and English
✅ Type-safe translation access through helper classes
✅ Language switcher dialog in Settings
✅ Persistent language selection
✅ RTL (Right-to-Left) support for Arabic
✅ All screens updated with translations

## How to Use Translations in Your Code

### Method 1: Using the AppLocalizations Helper (Recommended)

```dart
import 'package:fashion_flutter/core/services/app_localizations.dart';

// Common translations
Text(AppLocalizations.common.showAll)
Text(AppLocalizations.common.description)
Text(AppLocalizations.common.save)

// Auth translations
Text(AppLocalizations.auth.login)
Text(AppLocalizations.auth.emailAddress)
Text(AppLocalizations.auth.forgotPassword)

// Home translations
Text(AppLocalizations.home.collections)
Text(AppLocalizations.home.newArrivals)

// Product translations
Text(AppLocalizations.product.addToCart)
Text(AppLocalizations.product.color)
Text(AppLocalizations.product.size)

// Cart translations
Text(AppLocalizations.cart.myCart)
Text(AppLocalizations.cart.checkout)

// Orders translations
Text(AppLocalizations.orders.myOrders)
Text(AppLocalizations.orders.orderDetails)

// Settings translations
Text(AppLocalizations.settings.language)
Text(AppLocalizations.settings.notification)
```

### Method 2: Using Direct Translation Keys

```dart
import 'package:easy_localization/easy_localization.dart';

Text('common.show_all'.tr())
Text('auth.login'.tr())
Text('home.collections'.tr())
```

## Translation Categories

The translations are organized into the following categories:

- **common**: Shared text across the app (save, cancel, delete, etc.)
- **auth**: Authentication-related text (login, register, password, etc.)
- **home**: Home screen text (collections, new arrivals, etc.)
- **product**: Product-related text (add to cart, color, size, etc.)
- **cart**: Shopping cart text
- **orders**: Order management text
- **checkout**: Checkout process text
- **addresses**: Address management text
- **settings**: Settings screen text
- **discover**: Search and discovery text
- **filter**: Filtering options text
- **notification**: Notification-related text
- **profile**: User profile text
- **categories**: Product categories
- **errors**: Error messages
- **success_messages**: Success messages

## How to Change Language

Users can change the language from the Settings screen:

1. Navigate to Settings
2. Tap on "Language"
3. Select either English or Arabic
4. The app will immediately update to the selected language

The selected language is saved and will persist across app restarts.

## How to Add New Translations

### Step 1: Add to Translation Files

Add your new translation key to both files:

**en.json**:
```json
{
  "home": {
    "collections": "Collections",
    "your_new_key": "Your New Text"
  }
}
```

**ar.json**:
```json
{
  "home": {
    "collections": "المجموعات",
    "your_new_key": "النص الجديد الخاص بك"
  }
}
```

### Step 2: Add to AppLocalizations Helper

Edit `lib/core/services/app_localizations.dart`:

```dart
class HomeTranslations {
  String get collections => 'home.collections'.tr();
  String get yourNewKey => 'home.your_new_key'.tr();  // Add this
}
```

### Step 3: Use in Your Code

```dart
Text(AppLocalizations.home.yourNewKey)
```

## Programmatically Changing Language

You can change the language programmatically:

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/core/services/constants.dart';

// Change to Arabic
await context.setLocale(const Locale('ar'));
await getIt<LocalDBService>().setString(langKey, 'ar');

// Change to English
await context.setLocale(const Locale('en'));
await getIt<LocalDBService>().setString(langKey, 'en');
```

## Getting Current Language

```dart
import 'package:easy_localization/easy_localization.dart';

// Get current locale
final currentLocale = context.locale;
final languageCode = currentLocale.languageCode; // 'en' or 'ar'

// Check if current language is Arabic
final isArabic = context.locale.languageCode == 'ar';
```

## RTL Support

The app automatically handles RTL (Right-to-Left) layout for Arabic:

- Text direction is automatically adjusted
- UI elements are mirrored appropriately
- No additional code needed

## Translation File Locations

- English: `assets/translations/en.json`
- Arabic: `assets/translations/ar.json`
- Helper class: `lib/core/services/app_localizations.dart`
- Language switcher: `lib/core/widgets/language_switcher_dialog.dart`

## Updated Screens

The following screens have been updated with translations:

### Core Widgets
- ✅ show_all_widget.dart
- ✅ language_switcher_dialog.dart

### Home
- ✅ home_view.dart
- ✅ collections_list_view.dart

### Auth
- ✅ login_view.dart

### Product Details
- ✅ product_details_view.dart
- ✅ descripation_widget.dart
- ✅ color_size_widget.dart
- ✅ similar_products_widget.dart

### Cart
- ✅ cart_view.dart
- ✅ cart_payment_info_widget.dart

### Orders
- ✅ order_details_view.dart
- ✅ orders_header_widget.dart

### Checkout
- ✅ order_placed_view.dart

### Settings
- ✅ setting_view.dart

## Best Practices

1. **Always use AppLocalizations helper** for type safety and autocomplete
2. **Keep translation keys organized** by feature/screen
3. **Use descriptive key names** (e.g., `emailAddress` instead of `email1`)
4. **Test both languages** when adding new features
5. **Keep translations consistent** across the app
6. **Add context** in translation keys when needed (e.g., `cart.productPrice` vs `product.price`)

## Troubleshooting

### Translations not showing
- Make sure you've run `flutter pub get`
- Verify the translation key exists in both `en.json` and `ar.json`
- Check that you're importing the correct files

### Language not persisting
- Ensure `LocalDBService` is properly initialized
- Check that `langKey` constant is defined in `constants.dart`

### RTL issues
- The app should automatically handle RTL for Arabic
- If issues persist, check that `Directionality` widget is not overriding the default behavior

## Need Help?

If you need to add translations to more screens, follow the same pattern:

1. Add translation keys to both JSON files
2. Update the AppLocalizations helper class
3. Replace hardcoded strings with `AppLocalizations.category.key`
4. Test in both languages

Happy coding! 🚀
