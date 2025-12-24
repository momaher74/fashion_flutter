import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/addresses/logic/address_cubit.dart';
import 'package:fashion_flutter/features/addresses/logic/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/services/constants.dart';
import '../../../core/widgets/custome_text_form_filed_widget.dart';
import '../../../core/widgets/primary_button.dart';
import '../data/model/address_model.dart';

class EditAddressView extends StatefulWidget {
  const EditAddressView({super.key, required this.addressModel});

  final AddressModel addressModel;

  @override
  State<EditAddressView> createState() => _UpdateAddressViewState();
}

class _UpdateAddressViewState extends State<EditAddressView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController streetController;
  late final TextEditingController cityController;
  late final TextEditingController governorateController;
  late final TextEditingController notesController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.addressModel.name);
    phoneController = TextEditingController(text: widget.addressModel.phone);
    streetController = TextEditingController(text: widget.addressModel.street);
    cityController = TextEditingController(text: widget.addressModel.city);
    governorateController = TextEditingController(
      text: widget.addressModel.governorate,
    );
    notesController = TextEditingController(
      text: widget.addressModel.notes ?? '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    streetController.dispose();
    cityController.dispose();
    governorateController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AddressCubit>(),
      child: Scaffold(
        body: BlocListener<AddressCubit, AddressState>(
          listener: (context, state) {
            if (state is AddressActionSuccess) {
              context.pop(true);
            } else if (state is AddressError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: verticalSpace,
                children: [
                  headerGap(),
                  const ShoppingAppBar(title: "Edit Address", horizontal: 0),
                  CustomTextFormField(
                    hintText: "Name",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "Phone Number",
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "Street",
                    controller: streetController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter street';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "City",
                    controller: cityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter city';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "Governorate",
                    controller: governorateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter governorate';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "Notes (Optional)",
                    controller: notesController,
                    maxLines: 3,
                  ),
                  const Gap(80),
                  BlocBuilder<AddressCubit, AddressState>(
                    builder: (context, state) {
                      final isLoading = state is AddressActionLoading;
                      return PrimaryButton(
                        title: isLoading ? "Updating..." : "Update Address",
                        onTap: isLoading
                            ? () {}
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  final updatedAddress = AddressModel(
                                    id: widget.addressModel.id,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    street: streetController.text,
                                    city: cityController.text,
                                    governorate: governorateController.text,
                                    notes: notesController.text.isEmpty
                                        ? null
                                        : notesController.text,
                                  );
                                  if (widget.addressModel.id != null) {
                                    context.read<AddressCubit>().updateAddress(
                                      widget.addressModel.id!,
                                      updatedAddress,
                                    );
                                  }
                                }
                              },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
