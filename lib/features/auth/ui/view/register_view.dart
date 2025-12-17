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
              "Create \nyour account",
              fontSize: size25,
              fontWeight: bold,
            ),
            Gap(30),

            CustomTextFormField(underLine: true, hintText: "Enter your name"),
            CustomTextFormField(underLine: true, hintText: "Email address"),

            CustomTextFormField(hintText: "Password", underLine: true ,obscureText: true,),
            CustomTextFormField(hintText: "Confirm Password", underLine: true ,obscureText: true,),
            Gap(30),

            PrimaryButton(title: "Register", onTap: () {}),
            Gap(10),

            Center(
              child: CustomText(
                "or sign up with",
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
