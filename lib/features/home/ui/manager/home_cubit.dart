import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/home_model.dart';
import '../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeState.initial());

  Future<void> getHome() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await repo.getHome();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.error,
          errorMessage: failure.toString(),
        ),
      ),
      (home) {

        print(home) ;
        emit(
          state.copyWith(
            status: HomeStatus.success,
            homeModel: HomeModel.fromJson(home),
          ),
        );
      },
    );
  }
}
