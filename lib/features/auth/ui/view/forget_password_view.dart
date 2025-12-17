import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/custome_text_form_filed_widget.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: verticalSpace,
          children: [
            headerGap(),
            ShoppingAppBar(title: "", horizontal: 0),
            Gap(30),

            CustomText("Forgot password?", fontSize: size24, fontWeight: bold),
            CustomText(
              "Enter email associated with your account and we’ll send and email with instructions to reset your password",
              fontSize: 12,
            ),
            headerGap(),
            CustomTextFormField(underLine: true ,hintText: "enter your email here",prefixIcon: Icon(Icons.alternate_email), ),
            Gap(100) ,
            PrimaryButton(title: "Continue", onTap: (){})

          ],
        ),
      ),
    );
  }
}
