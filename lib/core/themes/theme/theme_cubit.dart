  import 'package:fashion_flutter/core/services/constants.dart';
  import 'package:fashion_flutter/core/services/local_service.dart';
  import 'package:fashion_flutter/core/services/locator.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:fashion_flutter/core/themes/theme/theme_state.dart';


class ThemeCubit extends Cubit<ThemeState> {
  final LocalDBService _prefs = getIt<LocalDBService>();

  ThemeCubit() : super(const ThemeState(isDark: false, isLoading: true));

  Future<void> loadInitialTheme() async {
    try {
      emit(state.copyWith(isLoading: true));

      final isDark = _prefs.getBool(
        themeKey,
        defaultValue: false,
      );

      emit(
        state.copyWith(
          isDark: isDark,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> toggleTheme() async {
    final newTheme = !state.isDark;
    emit(state.copyWith(isDark: newTheme));
    await _prefs.setBool(themeKey, newTheme);
  }
}
