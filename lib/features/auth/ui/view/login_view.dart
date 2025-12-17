import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/custome_text_form_filed_widget.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:fashion_flutter/features/auth/ui/view/widgets/social_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
            Gap(60),
            CustomText(
              "Log into \nyour account",
              fontSize: size25,
              fontWeight: bold,
            ),
            Gap(60),

            CustomTextFormField(underLine: true, hintText: "Email address"),

            CustomTextFormField(hintText: "Password", underLine: true),

            Align(
              alignment: Alignment.topRight,
              child: CustomText(
                "Forgot Password?",
                fontSize: 10,
                fontWeight: bold,
              ),
            ),

            PrimaryButton(title: "Login", onTap: () {}),
            Gap(30),

            Center(
              child: CustomText(
                "or log in with",
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
