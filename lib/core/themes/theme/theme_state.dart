class ThemeState {
  final bool isDark;
  final bool isLoading;
  final String? error;

  const ThemeState({
    required this.isDark,
    this.isLoading = false,
    this.error,
  });

  ThemeState copyWith({
    bool? isDark,
    bool? isLoading,
    String? error,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
