import 'package:easy_localization/easy_localization.dart';

/// Helper class for easy access to translations
/// Usage: AppLocalizations.home.collections
class AppLocalizations {
  // Common translations
  static CommonTranslations get common => CommonTranslations();

  // Auth translations
  static AuthTranslations get auth => AuthTranslations();

  // Home translations
  static HomeTranslations get home => HomeTranslations();

  // Product translations
  static ProductTranslations get product => ProductTranslations();

  // Cart translations
  static CartTranslations get cart => CartTranslations();

  // Orders translations
  static OrdersTranslations get orders => OrdersTranslations();

  // Checkout translations
  static CheckoutTranslations get checkout => CheckoutTranslations();

  // Addresses translations
  static AddressesTranslations get addresses => AddressesTranslations();

  // Settings translations
  static SettingsTranslations get settings => SettingsTranslations();

  // Discover translations
  static DiscoverTranslations get discover => DiscoverTranslations();

  // Filter translations
  static FilterTranslations get filter => FilterTranslations();

  // Notification translations
  static NotificationTranslations get notification =>
      NotificationTranslations();

  // Profile translations
  static ProfileTranslations get profile => ProfileTranslations();

  // Categories translations
  static CategoriesTranslations get categories => CategoriesTranslations();

  // Errors translations
  static ErrorsTranslations get errors => ErrorsTranslations();

  // Success messages translations
  static SuccessMessagesTranslations get successMessages =>
      SuccessMessagesTranslations();

  // App name
  static String get appName => 'app_name'.tr();
}

class CommonTranslations {
  String get showAll => 'common.show_all'.tr();
  String get description => 'common.description'.tr();
  String get name => 'common.name'.tr();
  String get email => 'common.email'.tr();
  String get password => 'common.password'.tr();
  String get confirmPassword => 'common.confirm_password'.tr();
  String get phone => 'common.phone'.tr();
  String get address => 'common.address'.tr();
  String get save => 'common.save'.tr();
  String get cancel => 'common.cancel'.tr();
  String get delete => 'common.delete'.tr();
  String get edit => 'common.edit'.tr();
  String get add => 'common.add'.tr();
  String get update => 'common.update'.tr();
  String get search => 'common.search'.tr();
  String get filter => 'common.filter'.tr();
  String get sort => 'common.sort'.tr();
  String get apply => 'common.apply'.tr();
  String get reset => 'common.reset'.tr();
  String get done => 'common.done'.tr();
  String get back => 'common.back'.tr();
  String get next => 'common.next'.tr();
  String get submit => 'common.submit'.tr();
  String get loading => 'common.loading'.tr();
  String get error => 'common.error'.tr();
  String get success => 'common.success'.tr();
  String get ok => 'common.ok'.tr();
  String get yes => 'common.yes'.tr();
  String get no => 'common.no'.tr();
}

class AuthTranslations {
  String get login => 'auth.login'.tr();
  String get register => 'auth.register'.tr();
  String get logout => 'auth.logout'.tr();
  String get logIntoAccount => 'auth.log_into_account'.tr();
  String get createAccount => 'auth.create_account'.tr();
  String get emailAddress => 'auth.email_address'.tr();
  String get forgotPassword => 'auth.forgot_password'.tr();
  String get orLogInWith => 'auth.or_log_in_with'.tr();
  String get orSignUpWith => 'auth.or_sign_up_with'.tr();
  String get dontHaveAccount => 'auth.dont_have_account'.tr();
  String get alreadyHaveAccount => 'auth.already_have_account'.tr();
  String get signUp => 'auth.sign_up'.tr();
  String get signIn => 'auth.sign_in'.tr();
  String get changePassword => 'auth.change_password'.tr();
  String get oldPassword => 'auth.old_password'.tr();
  String get newPassword => 'auth.new_password'.tr();
  String get resetPassword => 'auth.reset_password'.tr();
  String get enterOtp => 'auth.enter_otp'.tr();
  String get otpSent => 'auth.otp_sent'.tr();
  String get verify => 'auth.verify'.tr();
  String get resendOtp => 'auth.resend_otp'.tr();
}

class HomeTranslations {
  String get collections => 'home.collections'.tr();
  String get newArrivals => 'home.new_arrivals'.tr();
  String get recommended => 'home.recommended'.tr();
  String get trending => 'home.trending'.tr();
  String get categories => 'home.categories'.tr();
  String get featured => 'home.featured'.tr();
  String get bestSellers => 'home.best_sellers'.tr();
  String get specialOffers => 'home.special_offers'.tr();
}

class ProductTranslations {
  String get productDetails => 'product.product_details'.tr();
  String get similarProducts => 'product.similar_products'.tr();
  String get color => 'product.color'.tr();
  String get size => 'product.size'.tr();
  String get quantity => 'product.quantity'.tr();
  String get addToCart => 'product.add_to_cart'.tr();
  String get buyNow => 'product.buy_now'.tr();
  String get reviews => 'product.reviews'.tr();
  String get writeReview => 'product.write_review'.tr();
  String get rating => 'product.rating'.tr();
  String get price => 'product.price'.tr();
  String get discount => 'product.discount'.tr();
  String get inStock => 'product.in_stock'.tr();
  String get outOfStock => 'product.out_of_stock'.tr();
}

class CartTranslations {
  String get myCart => 'cart.my_cart'.tr();
  String get cartEmpty => 'cart.cart_empty'.tr();
  String get productPrice => 'cart.product_price'.tr();
  String get shipping => 'cart.shipping'.tr();
  String get subtotal => 'cart.subtotal'.tr();
  String get total => 'cart.total'.tr();
  String get checkout => 'cart.checkout'.tr();
  String get continueShopping => 'cart.continue_shopping'.tr();
  String get removeFromCart => 'cart.remove_from_cart'.tr();
}

class OrdersTranslations {
  String get myOrders => 'orders.my_orders'.tr();
  String get orderDetails => 'orders.order_details'.tr();
  String get orderNumber => 'orders.order_number'.tr();
  String get orderDate => 'orders.order_date'.tr();
  String get orderStatus => 'orders.order_status'.tr();
  String get orderTotal => 'orders.order_total'.tr();
  String get pending => 'orders.pending'.tr();
  String get delivered => 'orders.delivered'.tr();
  String get cancelled => 'orders.cancelled'.tr();
  String get processing => 'orders.processing'.tr();
  String get shipped => 'orders.shipped'.tr();
  String get orderProducts => 'orders.order_products'.tr();
  String get orderCompleted => 'orders.order_completed'.tr();
  String get thankYouMessage => 'orders.thank_you_message'.tr();
  String get yourOrderDelivered => 'orders.your_order_delivered'.tr();
  String get rateProductMessage => 'orders.rate_product_message'.tr();
  String get rateOrder => 'orders.rate_order'.tr();
  String get orderId => 'orders.order_id'.tr();
  String get paymentMethod => 'orders.payment_method'.tr();
  String get deliveryAddress => 'orders.delivery_address'.tr();
}

class CheckoutTranslations {
  String get checkout => 'checkout.checkout'.tr();
  String get shippingAddress => 'checkout.shipping_address'.tr();
  String get paymentMethod => 'checkout.payment_method'.tr();
  String get orderSummary => 'checkout.order_summary'.tr();
  String get placeOrder => 'checkout.place_order'.tr();
  String get cashOnDelivery => 'checkout.cash_on_delivery'.tr();
  String get creditCard => 'checkout.credit_card'.tr();
  String get selectAddress => 'checkout.select_address'.tr();
  String get addNewAddress => 'checkout.add_new_address'.tr();
}

class AddressesTranslations {
  String get myAddresses => 'addresses.my_addresses'.tr();
  String get addAddress => 'addresses.add_address'.tr();
  String get editAddress => 'addresses.edit_address'.tr();
  String get deleteAddress => 'addresses.delete_address'.tr();
  String get street => 'addresses.street'.tr();
  String get city => 'addresses.city'.tr();
  String get state => 'addresses.state'.tr();
  String get country => 'addresses.country'.tr();
  String get postalCode => 'addresses.postal_code'.tr();
  String get setDefault => 'addresses.set_default'.tr();
  String get defaultAddress => 'addresses.default_address'.tr();
}

class SettingsTranslations {
  String get settings => 'settings.settings'.tr();
  String get language => 'settings.language'.tr();
  String get notification => 'settings.notification'.tr();
  String get termsOfUse => 'settings.terms_of_use'.tr();
  String get privacyPolicy => 'settings.privacy_policy'.tr();
  String get addresses => 'settings.addresses'.tr();
  String get theme => 'settings.theme'.tr();
  String get darkMode => 'settings.dark_mode'.tr();
  String get lightMode => 'settings.light_mode'.tr();
  String get account => 'settings.account'.tr();
  String get profile => 'settings.profile'.tr();
  String get help => 'settings.help'.tr();
  String get about => 'settings.about'.tr();
  String get version => 'settings.version'.tr();
  String get contactUs => 'settings.contact_us'.tr();
}

class DiscoverTranslations {
  String get discover => 'discover.discover'.tr();
  String get searchProducts => 'discover.search_products'.tr();
  String get recentSearches => 'discover.recent_searches'.tr();
  String get popularSearches => 'discover.popular_searches'.tr();
  String get noResults => 'discover.no_results'.tr();
  String get clearSearch => 'discover.clear_search'.tr();
}

class FilterTranslations {
  String get filter => 'filter.filter'.tr();
  String get priceRange => 'filter.price_range'.tr();
  String get brand => 'filter.brand'.tr();
  String get category => 'filter.category'.tr();
  String get rating => 'filter.rating'.tr();
  String get clearFilters => 'filter.clear_filters'.tr();
  String get applyFilters => 'filter.apply_filters'.tr();
}

class NotificationTranslations {
  String get notifications => 'notification.notifications'.tr();
  String get noNotifications => 'notification.no_notifications'.tr();
  String get markAllRead => 'notification.mark_all_read'.tr();
  String get clearAll => 'notification.clear_all'.tr();
}

class ProfileTranslations {
  String get profile => 'profile.profile'.tr();
  String get editProfile => 'profile.edit_profile'.tr();
  String get personalInfo => 'profile.personal_info'.tr();
  String get fullName => 'profile.full_name'.tr();
  String get phoneNumber => 'profile.phone_number'.tr();
  String get dateOfBirth => 'profile.date_of_birth'.tr();
  String get gender => 'profile.gender'.tr();
  String get male => 'profile.male'.tr();
  String get female => 'profile.female'.tr();
}

class CategoriesTranslations {
  String get women => 'categories.women'.tr();
  String get men => 'categories.men'.tr();
  String get kids => 'categories.kids'.tr();
  String get accessories => 'categories.accessories'.tr();
  String get shoes => 'categories.shoes'.tr();
  String get bags => 'categories.bags'.tr();
  String get jewelry => 'categories.jewelry'.tr();
  String get watches => 'categories.watches'.tr();
}

class ErrorsTranslations {
  String get networkError => 'errors.network_error'.tr();
  String get serverError => 'errors.server_error'.tr();
  String get invalidCredentials => 'errors.invalid_credentials'.tr();
  String get requiredField => 'errors.required_field'.tr();
  String get invalidEmail => 'errors.invalid_email'.tr();
  String get passwordMismatch => 'errors.password_mismatch'.tr();
  String get weakPassword => 'errors.weak_password'.tr();
}

class SuccessMessagesTranslations {
  String get loginSuccess => 'success_messages.login_success'.tr();
  String get registerSuccess => 'success_messages.register_success'.tr();
  String get passwordChanged => 'success_messages.password_changed'.tr();
  String get profileUpdated => 'success_messages.profile_updated'.tr();
  String get addressAdded => 'success_messages.address_added'.tr();
  String get addressUpdated => 'success_messages.address_updated'.tr();
  String get addressDeleted => 'success_messages.address_deleted'.tr();
  String get orderPlaced => 'success_messages.order_placed'.tr();
  String get reviewSubmitted => 'success_messages.review_submitted'.tr();
}
