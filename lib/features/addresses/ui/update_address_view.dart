import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/services/constants.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../../core/widgets/custome_text_form_filed_widget.dart';
import '../../../core/widgets/primary_button.dart';
import '../data/model/address_model.dart';


class EditAddressView extends StatefulWidget {
  const EditAddressView({
    super.key,
    required this.addressModel,
  });

  final AddressModel addressModel;

  @override
  State<EditAddressView> createState() => _UpdateAddressViewState();
}

class _UpdateAddressViewState extends State<EditAddressView> {
  late final TextEditingController usernameController;
  late final TextEditingController phoneController;
  late final TextEditingController streetController;
  late final TextEditingController cityController;
  late final TextEditingController stateController;
  late final TextEditingController zipController;

  @override
  void initState() {
    super.initState();

    usernameController =
        TextEditingController(text: widget.addressModel.username);
    phoneController =
        TextEditingController(text: widget.addressModel.phoneNumber);
    streetController =
        TextEditingController(text: widget.addressModel.street);
    cityController =
        TextEditingController(text: widget.addressModel.city);
    stateController =
        TextEditingController(text: widget.addressModel.state);
    zipController =
        TextEditingController(text: widget.addressModel.zipCode);
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    streetController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: verticalSpace,
          children: [
            headerGap(),

            ShoppingAppBar(title: "Edit Address",) ,
            CustomTextFormField(
              hintText: "Username",
              controller: usernameController,
            ),

            CustomTextFormField(
              hintText: "Phone Number",
              controller: phoneController,
            ),

            CustomTextFormField(
              hintText: "Street",
              controller: streetController,
            ),

            CustomTextFormField(
              hintText: "City",
              controller: cityController,
            ),

            CustomTextFormField(
              hintText: "State",
              controller: stateController,
            ),

            CustomTextFormField(
              hintText: "Zip Code",
              controller: zipController,
            ),

            const Gap(80),

            PrimaryButton(
              title: "Edit Address", onTap: () {  },


            ),
          ],
        ),
      ),
    );
  }
}
