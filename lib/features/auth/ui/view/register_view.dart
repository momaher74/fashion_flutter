import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/features/auth/ui/view/widgets/social_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/custome_text_form_filed_widget.dart';
import '../../../../core/widgets/primary_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              underLine: true,
              hintText: AppLocalizations.common.name,
            ),
            CustomTextFormField(
              underLine: true,
              hintText: AppLocalizations.auth.emailAddress,
            ),

            CustomTextFormField(
              hintText: AppLocalizations.common.password,
              underLine: true,
              obscureText: true,
            ),
            CustomTextFormField(
              hintText: AppLocalizations.common.confirmPassword,
              underLine: true,
              obscureText: true,
            ),
            Gap(30),

            PrimaryButton(title: AppLocalizations.auth.register, onTap: () {}),
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
    );
  }
}
