import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/custome_text_form_filed_widget.dart';
import '../../../../core/widgets/primary_button.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

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
              "Create new password",
              fontSize: size25,
              fontWeight: bold,
            ),

            CustomText(
              "Your new password must be different from previously\n used password",
            ),
            Gap(60),

            CustomTextFormField(
              hintText: "Enter Old Password",
              underLine: true,
              obscureText: true,
            ),
            CustomTextFormField(
              hintText: "New Password",
              underLine: true,
              obscureText: true,
            ),
            CustomTextFormField(
              hintText: "Confirm Password",
              underLine: true,
              obscureText: true,
            ),
            Gap(80),

            PrimaryButton(title: "Confirm", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
