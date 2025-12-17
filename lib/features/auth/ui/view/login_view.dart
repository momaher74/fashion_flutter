import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/services/local_db_keys.dart';
import 'package:fashion_flutter/core/services/local_service.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/custome_text_form_filed_widget.dart';
import 'package:fashion_flutter/core/widgets/error_dialog.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:fashion_flutter/features/auth/ui/manager/auth_cubit/auth_cubit.dart';
import 'package:fashion_flutter/features/auth/ui/view/widgets/social_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/locator.dart';
import '../../../../core/widgets/custom_loading_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.data != null) {
            LocalDBService localDBService = getIt<LocalDBService>();

            localDBService.setString(tokenKey, state.data!.data.token).then((
              v,
            ) {

            });



            context.pushReplacementNamed(layoutView);
          }

          if(state.error !=null){
            print("SHOW ERROR MSG");
            showError(context: context, message: state.error!.toString());
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
                Gap(60),
                CustomText(
                  AppLocalizations.auth.logIntoAccount,
                  fontSize: size25,
                  fontWeight: bold,
                ),
                Gap(60),

                CustomTextFormField(
                  controller: email,
                  underLine: true,
                  hintText: AppLocalizations.auth.emailAddress,
                ),

                CustomTextFormField(
                  controller: password,
                  hintText: AppLocalizations.common.password,
                  underLine: true,
                ),

                Align(
                  alignment: Alignment.topRight,
                  child: CustomText(
                    AppLocalizations.auth.forgotPassword,
                    fontSize: 10,
                    fontWeight: bold,
                  ),
                ),

                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return CustomLoadingWidget();
                    }
                    return PrimaryButton(
                      title: AppLocalizations.auth.login,
                      onTap: () {
                        context.read<AuthCubit>().login(
                          email: email.text,
                          password: password.text,
                        );
                      },
                    );
                  },
                ),
                Gap(30),

                Center(
                  child: CustomText(
                    AppLocalizations.auth.orLogInWith,
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
