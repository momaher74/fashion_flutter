import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/custome_text_form_filed_widget.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/services/constants.dart';

class CreateAddressView extends StatelessWidget {
  const CreateAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: verticalSpace,
          children: [
            headerGap()  ,

            CustomText("Add New Address" , fontWeight: bold, fontSize: size18,) ,

            CustomTextFormField(hintText: "username",) ,
            CustomTextFormField(hintText: "phone number",) ,
        
            CustomTextFormField(hintText: "street",) ,
            CustomTextFormField(hintText: "city",) ,
            CustomTextFormField(hintText: "state",) ,
            CustomTextFormField(hintText: "zip-code",) ,
            Gap(80) ,
            PrimaryButton(title: "Add New Address")
        
        
          ],
        ),
      ), 
    );
  }
}
