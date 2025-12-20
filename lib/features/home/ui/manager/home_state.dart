part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

@immutable
class HomeState {
  final HomeStatus status;
  final HomeModel? homeModel;
  final String? errorMessage;

  const HomeState({
    required this.status,
    this.homeModel,
    this.errorMessage,
  });

  factory HomeState.initial() {
    return const HomeState(status: HomeStatus.initial);
  }

  HomeState copyWith({
    HomeStatus? status,
    HomeModel? homeModel,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      homeModel: homeModel ?? this.homeModel,
      errorMessage: errorMessage,
    );
  }
}
