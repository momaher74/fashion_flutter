import 'package:easy_localization/easy_localization.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/core/themes/app_themes.dart';
import 'package:fashion_flutter/core/themes/theme/theme_cubit.dart';
import 'package:fashion_flutter/core/themes/theme/theme_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/filter/ui/filter_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();

  // Load saved locale or use fallback
  final savedLanguage = getIt<LocalDBService>().getString(langKey, defaultValue: "ar");
  final startLocale = Locale(savedLanguage);

  runApp(
    BlocProvider(
      create: (_) => ThemeCubit()..loadInitialTheme(),
      child: EasyLocalization(
        supportedLocales: [const Locale('en'), const Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
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
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        // Show empty container while loading
        if (state.isLoading) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: AppThemes.lightTheme,
          darkTheme:AppThemes.darkTheme   ,
          home: const FilterView(),
        );
      },
    );
  }
}
