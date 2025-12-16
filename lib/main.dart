import 'package:easy_localization/easy_localization.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/core/themes/app_themes.dart';
import 'package:fashion_flutter/core/themes/theme/theme_cubit.dart';
import 'package:fashion_flutter/core/themes/theme/theme_state.dart';
import 'package:fashion_flutter/features/addresses/ui/get_addresses_view.dart';
import 'package:fashion_flutter/features/orders/ui/orders_view.dart';
import 'package:fashion_flutter/features/orders/ui/rate_order_view.dart';
import 'package:fashion_flutter/features/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/addresses/ui/create_address_view.dart';
import 'features/orders/ui/order_details_view.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();

  // Load saved locale or use fallback
  final savedLanguage = getIt<LocalDBService>().getString(langKey, defaultValue: "en");
  final startLocale = Locale(savedLanguage);

  runApp(
    BlocProvider(
      create: (_) => ThemeCubit()..loadInitialTheme(),
      child: EasyLocalization(
        supportedLocales: [const Locale('en'), const Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: startLocale,
        child: const MyApp(),
      ),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X (recommended)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const MaterialApp(
                home: Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
              );
            }

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fashion App',
              themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              home:RateOrderView(),
            );
          },
        );
      },
    );
  }
}
