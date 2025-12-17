# Quick Start Guide - Easy Localization

## 🚀 Quick Start

Your app now supports **English** and **Arabic**! Here's everything you need to know.

## 📱 For Users

### How to Change Language

1. **Open the app**
2. **Go to Settings** (الإعدادات)
3. **Tap "Language"** (اللغة)
4. **Choose your language:**
   - 🇺🇸 English
   - 🇸🇦 العربية (Arabic)
5. **Done!** The app updates instantly

The app will remember your choice next time you open it.

---

## 👨‍💻 For Developers

### Using Translations in Your Code

#### ✅ DO THIS (Recommended)
```dart
import 'package:fashion_flutter/core/services/app_localizations.dart';

// Use the helper class
Text(AppLocalizations.auth.login)
Text(AppLocalizations.home.collections)
Text(AppLocalizations.cart.checkout)
```

#### ❌ DON'T DO THIS
```dart
// Don't use hardcoded strings
Text("Login")
Text("Collections")
Text("Checkout")
```

### Common Examples

#### Buttons
```dart
PrimaryButton(
  title: AppLocalizations.auth.login,
  onTap: () {},
)
```

#### Text Fields
```dart
CustomTextFormField(
  hintText: AppLocalizations.auth.emailAddress,
)
```

#### Labels
```dart
CustomText(
  AppLocalizations.product.price,
  fontSize: 14,
)
```

#### App Bars
```dart
ShoppingAppBar(
  title: AppLocalizations.cart.myCart,
)
```

### Available Translation Categories

```dart
AppLocalizations.common.*      // save, cancel, delete, etc.
AppLocalizations.auth.*        // login, register, password, etc.
AppLocalizations.home.*        // collections, new arrivals, etc.
AppLocalizations.product.*     // add to cart, color, size, etc.
AppLocalizations.cart.*        // my cart, checkout, shipping, etc.
AppLocalizations.orders.*      // my orders, order details, etc.
AppLocalizations.checkout.*    // checkout, place order, etc.
AppLocalizations.addresses.*   // my addresses, add address, etc.
AppLocalizations.settings.*    // language, notification, etc.
AppLocalizations.discover.*    // search, recent searches, etc.
AppLocalizations.filter.*      // filter, price range, etc.
AppLocalizations.notification.* // notifications, mark all read, etc.
AppLocalizations.profile.*     // profile, edit profile, etc.
AppLocalizations.categories.*  // women, men, kids, etc.
AppLocalizations.errors.*      // error messages
AppLocalizations.successMessages.* // success messages
```

### Adding New Translations

**1. Add to JSON files:**

`assets/translations/en.json`:
```json
{
  "home": {
    "new_feature": "New Feature"
  }
}
```

`assets/translations/ar.json`:
```json
{
  "home": {
    "new_feature": "ميزة جديدة"
  }
}
```

**2. Add to helper class:**

`lib/core/services/app_localizations.dart`:
```dart
class HomeTranslations {
  String get newFeature => 'home.new_feature'.tr();
}
```

**3. Use in your code:**
```dart
Text(AppLocalizations.home.newFeature)
```

---

## 📊 What's Translated

### ✅ Fully Translated (16 screens)
- Login & Register screens
- Home screen
- Product details
- Shopping cart
- Order details
- Settings
- And more...

### 🔄 To Be Translated (29 screens)
See `TRANSLATION_CHECKLIST.md` for the complete list.

---

## 🎨 Features

✅ **Instant Language Switching** - No app restart needed
✅ **Persistent Selection** - Your choice is saved
✅ **RTL Support** - Perfect Arabic layout
✅ **Type-Safe** - Autocomplete and compile-time checking
✅ **Easy to Extend** - Add new languages easily

---

## 🔍 Testing

### Test Language Switching
1. Run the app
2. Go to Settings → Language
3. Switch between English and Arabic
4. Verify all text updates correctly
5. Check RTL layout for Arabic

### Test Persistence
1. Change language to Arabic
2. Close the app completely
3. Reopen the app
4. Verify it's still in Arabic

---

## 📝 Code Examples

### Before (Hardcoded)
```dart
class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Log into your account"),
          CustomTextFormField(hintText: "Email address"),
          CustomTextFormField(hintText: "Password"),
          PrimaryButton(title: "Login", onTap: () {}),
        ],
      ),
    );
  }
}
```

### After (Localized)
```dart
import 'package:fashion_flutter/core/services/app_localizations.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(AppLocalizations.auth.logIntoAccount),
          CustomTextFormField(
            hintText: AppLocalizations.auth.emailAddress,
          ),
          CustomTextFormField(
            hintText: AppLocalizations.common.password,
          ),
          PrimaryButton(
            title: AppLocalizations.auth.login,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
```

---

## 🆘 Troubleshooting

### Problem: Translations not showing
**Solution:** 
- Run `flutter pub get`
- Verify translation keys exist in both JSON files
- Check imports

### Problem: Language not persisting
**Solution:**
- Ensure `LocalDBService` is initialized
- Check `langKey` constant exists

### Problem: RTL issues
**Solution:**
- The app handles RTL automatically
- Don't override `Directionality` widget

---

## 📚 More Information

- **Full Guide:** See `LOCALIZATION_GUIDE.md`
- **Checklist:** See `TRANSLATION_CHECKLIST.md`
- **Summary:** See `LOCALIZATION_SUMMARY.md`

---

## 🎯 Next Steps

1. ✅ Language switching works
2. ✅ 16 screens translated
3. 🔄 Update remaining 29 screens
4. 🔄 Add more languages (optional)

---

**Happy Coding! 🚀**
