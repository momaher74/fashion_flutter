import 'package:flutter/material.dart';
import 'package:flutter_otp_kit/flutter_otp_kit.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/custome_text_form_filed_widget.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/shopping_app_bar.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

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

            CustomText("Verification code", fontSize: size24, fontWeight: bold),
            CustomText(
              "Please enter the verification code we sent to your email address",
              fontSize: 12,
            ),
            headerGap(),
            OtpKit(
              fieldCount: 4,
              onVerify: (otp) async {
                return true;
              },
              resendStyle: TextStyle(color: primaryColor, fontWeight: bold),

              primaryColor: primaryColor,
              fieldConfig: OtpFieldConfig(fieldShape: OtpFieldShape.circle),

              cursorEnableAnimationOverride: true,
              animationConfig: OtpAnimationConfig(
                enableAnimation: true,
                fieldFillAnimationType: FieldFillAnimationType.rotate,
                errorFieldAnimationType: ErrorFieldAnimationType.bounce,
              ),
              // Performance optimization
              performanceConfig: OtpPerformanceConfig(
                enableLazyLoading: true,
                enableMemoryOptimization: true,
                enableAnimationPooling: true,
                enablePerformanceMonitoring: true,
              ),
              buttonBackgroundColor: Colors.black,
              onResend: () {
                // Resend OTP logic
              },
            ),
            Gap(100),
          ],
        ),
      ),
    );
  }
}
