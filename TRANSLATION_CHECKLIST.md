# Screens to Update with Translations

This file lists all the screens that still need to be updated with translations. Use this as a checklist.

## ✅ Already Updated Screens

### Core Widgets
- [x] show_all_widget.dart
- [x] language_switcher_dialog.dart

### Home
- [x] home_view.dart
- [x] collections_list_view.dart

### Auth
- [x] login_view.dart

### Product Details
- [x] product_details_view.dart
- [x] descripation_widget.dart
- [x] color_size_widget.dart
- [x] similar_products_widget.dart

### Cart
- [x] cart_view.dart
- [x] cart_payment_info_widget.dart

### Orders
- [x] order_details_view.dart
- [x] orders_header_widget.dart

### Checkout
- [x] order_placed_view.dart

### Settings
- [x] setting_view.dart

---

## 📝 Screens to Update

### Auth Screens
- [ ] register_view.dart
- [ ] forget_password_view.dart
- [ ] reset_view.dart
- [ ] otp_view.dart
- [ ] change_password_view.dart

### Home Widgets
- [ ] products_grid_view.dart
- [ ] products_list_view.dart
- [ ] recommanded_list_view.dart
- [ ] custom_drawer_widget.dart

### Product Details Widgets
- [ ] reviews_listview_widget.dart
- [ ] product_header_widget.dart

### Cart Widgets
- [ ] cart_products_listview_widget.dart

### Orders Screens & Widgets
- [ ] orders_view.dart
- [ ] rate_order_view.dart
- [ ] order_item_widget.dart
- [ ] order_status_widget.dart
- [ ] order_info_widget.dart
- [ ] rate_header_widget.dart

### Checkout Screens
- [ ] checkout_view.dart

### Addresses Screens
- [ ] get_addresses_view.dart
- [ ] create_address_view.dart
- [ ] update_address_view.dart
- [ ] address_card_widget.dart

### Discover
- [ ] discover_view.dart
- [ ] search_field_widget.dart
- [ ] recent_search_widget.dart
- [ ] results_listview.dart

### Filter
- [ ] filter_view.dart
- [ ] filter_app_bar.dart
- [ ] filter_bottomsheet_widget.dart
- [ ] color_filter_item_widget.dart

### Notification
- [ ] notification_view.dart

### Layout
- [ ] layout_view.dart

---

## 🔧 How to Update a Screen

For each screen, follow these steps:

### 1. Import the AppLocalizations helper
```dart
import 'package:fashion_flutter/core/services/app_localizations.dart';
```

### 2. Replace hardcoded strings
**Before:**
```dart
Text("Email address")
```

**After:**
```dart
Text(AppLocalizations.auth.emailAddress)
```

### 3. Common Patterns

#### Buttons
```dart
// Before
PrimaryButton(title: "Login", onTap: () {})

// After
PrimaryButton(title: AppLocalizations.auth.login, onTap: () {})
```

#### Text Fields
```dart
// Before
CustomTextFormField(hintText: "Email address")

// After
CustomTextFormField(hintText: AppLocalizations.auth.emailAddress)
```

#### App Bars
```dart
// Before
ShoppingAppBar(title: "My Cart")

// After
ShoppingAppBar(title: AppLocalizations.cart.myCart)
```

#### Labels
```dart
// Before
CustomText("Product price")

// After
CustomText(AppLocalizations.cart.productPrice)
```

### 4. Check if translation exists

If the translation doesn't exist in the JSON files:

1. Add it to both `en.json` and `ar.json`
2. Add the getter to the appropriate class in `app_localizations.dart`
3. Use it in your code

---

## 📋 Translation Coverage by Feature

| Feature | Screens | Updated | Remaining |
|---------|---------|---------|-----------|
| Auth | 6 | 1 | 5 |
| Home | 5 | 2 | 3 |
| Product Details | 7 | 4 | 3 |
| Cart | 3 | 2 | 1 |
| Orders | 7 | 2 | 5 |
| Checkout | 2 | 1 | 1 |
| Addresses | 4 | 0 | 4 |
| Discover | 4 | 0 | 4 |
| Filter | 4 | 0 | 4 |
| Settings | 1 | 1 | 0 |
| Notification | 1 | 0 | 1 |
| Layout | 1 | 0 | 1 |
| **Total** | **45** | **15** | **30** |

---

## 🎯 Priority Order

### High Priority (User-facing screens)
1. register_view.dart
2. forget_password_view.dart
3. orders_view.dart
4. checkout_view.dart
5. discover_view.dart

### Medium Priority (Common widgets)
6. custom_drawer_widget.dart
7. products_grid_view.dart
8. products_list_view.dart
9. cart_products_listview_widget.dart
10. order_item_widget.dart

### Low Priority (Less frequently used)
11. All remaining screens

---

## 💡 Tips

- **Batch update**: Update all screens in a feature at once (e.g., all auth screens)
- **Test as you go**: Switch between languages to verify translations
- **Use find & replace**: Search for common patterns like `"Login"` to find hardcoded strings
- **Check for dynamic content**: Some text might be coming from the backend and shouldn't be translated in the code

---

Last updated: 2025-12-17
