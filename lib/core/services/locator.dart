import 'package:dio/dio.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:fashion_flutter/features/auth/data/repos/auth_repo.dart';
import 'package:fashion_flutter/features/discover/data/repo/discover_repo.dart';
import 'package:fashion_flutter/features/filter/data/repos/filter_repo.dart';
import 'package:fashion_flutter/features/filter/ui/manager/filter_cubit.dart';
import 'package:fashion_flutter/features/home/data/repos/home_repo.dart';
import 'package:fashion_flutter/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Local DB
  getIt.registerLazySingleton<LocalDBService>(
    () => LocalDBService(sharedPreferences),
  );

  // Dio
  getIt.registerLazySingleton(() => ApiServices.createDio());

  // Api Services
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(getIt<Dio>(), getIt<LocalDBService>()),
  );

  getIt.registerLazySingleton<AuthRepoImp>(
    () => AuthRepoImp(getIt<ApiServices>()),
  );

  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(apiServices: getIt<ApiServices>()),
  );

  getIt.registerLazySingleton<DiscoverRepoImpl>(
    () => DiscoverRepoImpl(api: getIt<ApiServices>()),
  );

  getIt.registerLazySingleton<FilterRepoImpl>(
    () => FilterRepoImpl(api: getIt<ApiServices>()),
  );



  getIt.registerLazySingleton<WishlistRepoImpl>(
        () => WishlistRepoImpl(api: getIt<ApiServices>()),
  );

  getIt.registerLazySingleton<FilterCubit>(() => FilterCubit());
}
