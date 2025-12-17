part of 'auth_cubit.dart';

@immutable
class AuthState {
  final bool isLoading;
  final AuthResponseModel? data;
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.data,
    this.error,
  });

  // الحالة الابتدائية
  factory AuthState.initial() {
    return const AuthState();
  }

  // copyWith لتحديث جزء من الحالة
  AuthState copyWith({
    bool? isLoading,
    AuthResponseModel? data,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
    );
  }
}
