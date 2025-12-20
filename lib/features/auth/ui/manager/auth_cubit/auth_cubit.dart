import 'package:bloc/bloc.dart';
import 'package:fashion_flutter/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/locator.dart';
import '../../../data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  final AuthRepoImp authRepoImp = getIt<AuthRepoImp>();

  void login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true));
    var result = await authRepoImp.login(
      data: {"email": email, "password": password},
    );

    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error?.toString()));
      },
      (data) {
        AuthResponseModel authResponseModel = AuthResponseModel.fromJson(data);
        print(data);
        emit(state.copyWith(isLoading: false, data: authResponseModel));
      },
    );
  }

  void register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(state.copyWith(isLoading: true));
    var result = await authRepoImp.register(
      data: {"email": email, "password": password, "name": name},
    );
    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error?.toString()));
      },
      (data) {
        AuthResponseModel authResponseModel = AuthResponseModel.fromJson(data);
        print(data);
        emit(state.copyWith(isLoading: false, data: authResponseModel));
      },
    );
  }
}
