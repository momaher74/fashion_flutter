import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register SharedPrefService as singleton
  getIt.registerLazySingleton<LocalDBService>(
    () => LocalDBService(sharedPreferences),
  );
}
