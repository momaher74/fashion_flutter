import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/core/widgets/error_dialog.dart';
import 'package:fashion_flutter/features/auth/ui/manager/auth_cubit/auth_cubit.dart';
import 'package:fashion_flutter/features/auth/ui/view/widgets/social_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes_names.dart';
import '../../../../core/services/constants.dart';
import '../../../../core/services/local_db_keys.dart';
import '../../../../core/services/local_service.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/custome_text_form_filed_widget.dart';
import '../../../../core/widgets/primary_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirm = TextEditingController();
    return BlocProvider<AuthCubit>(
      create: (BuildContext context) => AuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.error != null) {
            showError(context: context, message: state.error!);
          }
          if (state.data != null) {
            LocalDBService localDBService = getIt<LocalDBService>();

            localDBService.setString(
              accessTokenKey,
              state.data!.data.accessToken,
            );
            localDBService.setString(
              refreshTokenKey,
              state.data!.data.refreshToken,
            );

            context.pushReplacementNamed(layoutView);
          }
          // TODO: implement listener
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: verticalSpace,
              children: [
                headerGap(),
                Gap(40),
                CustomText(
                  AppLocalizations.auth.createAccount,
                  fontSize: size25,
                  fontWeight: bold,
                ),
                Gap(30),

                CustomTextFormField(
                  controller: name,
                  underLine: true,
                  hintText: AppLocalizations.common.name,
                ),
                CustomTextFormField(
                  underLine: true,
                  controller: email,
                  hintText: AppLocalizations.auth.emailAddress,
                ),

                CustomTextFormField(
                  controller: password,
                  hintText: AppLocalizations.common.password,
                  underLine: true,
                  obscureText: true,
                ),
                CustomTextFormField(
                  hintText: AppLocalizations.common.confirmPassword,
                  underLine: true,
                  obscureText: true,
                  controller: confirm,
                ),
                Gap(30),

                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return CustomLoadingWidget();
                    }
                    return PrimaryButton(
                      title: AppLocalizations.auth.register,
                      onTap: () {
                        if (confirm.text != password.text) {
                          showError(
                            context: context,
                            message:
                                "password and confirm password must be equal",
                          );
                          return;
                        }
                        context.read<AuthCubit>().register(
                          email: email.text,
                          password: password.text,
                          name: name.text,
                        );
                      },
                    );
                  },
                ),
                Gap(10),

                Center(
                  child: CustomText(
                    AppLocalizations.auth.orSignUpWith,
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIconWidget(type: "apple"),
                    SocialIconWidget(type: "google"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
