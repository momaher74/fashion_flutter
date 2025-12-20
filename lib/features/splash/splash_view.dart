import 'package:fashion_flutter/core/router/go_router_config.dart';
import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/local_db_keys.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/features/auth/data/models/user_model.dart';
import 'package:fashion_flutter/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Start session check but wait for animation
  }

  Future<void> _checkSession() async {
    final localDB = getIt<LocalDBService>();
    final refreshToken = localDB.getString(refreshTokenKey);

    if (refreshToken.isEmpty) {
      if (mounted) context.pushReplacementNamed(loginView);
      return;
    }

    final authRepo = getIt<AuthRepoImp>();
    final result = await authRepo.verifySession(refreshToken: refreshToken);

    result.fold(
      (error) async {
        await localDB.remove(accessTokenKey);
        await localDB.remove(refreshTokenKey);
        if (mounted) context.pushReplacementNamed(loginView);
      },
      (data) async {
        final authResponse = AuthResponseModel.fromJson(data);
        await localDB.setString(accessTokenKey, authResponse.data.accessToken);
        await localDB.setString(
          refreshTokenKey,
          authResponse.data.refreshToken,
        );
        if (mounted) context.pushReplacementNamed(layoutView);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Lottie.asset(
            'assets/animations/fashion.json',
            repeat: false,
            fit: BoxFit.cover,
            onLoaded: (composition) {
              Future.delayed(
                composition.duration.inSeconds > 3
                    ? const Duration(seconds: 3)
                    : composition.duration,
                () {
                  _checkSession();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
