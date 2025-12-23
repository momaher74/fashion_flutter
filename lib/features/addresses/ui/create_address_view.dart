import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/core/widgets/custome_text_form_filed_widget.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/addresses/data/model/address_model.dart';
import 'package:fashion_flutter/features/addresses/logic/address_cubit.dart';
import 'package:fashion_flutter/features/addresses/logic/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/services/constants.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _governorateController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _governorateController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddressCubit>(),
      child: Scaffold(
        body: BlocListener<AddressCubit, AddressState>(
          listener: (context, state) {
            if (state is AddressActionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
              context.pop(true); // Return true to indicate success
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: verticalSpace,
                children: [
                  headerGap(),
                  const ShoppingAppBar(title: "Add New Address", horizontal: 0),
                  CustomTextFormField(
                    hintText: "Name",
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "Phone Number",
                    controller: _phoneController,
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
                    controller: _streetController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter street';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "City",
                    controller: _cityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter city';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "Governorate",
                    controller: _governorateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter governorate';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    hintText: "Notes (Optional)",
                    controller: _notesController,
                    maxLines: 3,
                  ),
                  Gap(80),
                  BlocBuilder<AddressCubit, AddressState>(
                    builder: (context, state) {
                      final isLoading = state is AddressActionLoading;
                      return PrimaryButton(
                        title: isLoading ? "Adding..." : "Add New Address",
                        onTap: isLoading
                            ? () {}
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  final address = AddressModel(
                                    name: _nameController.text,
                                    phone: _phoneController.text,
                                    street: _streetController.text,
                                    city: _cityController.text,
                                    governorate: _governorateController.text,
                                    notes: _notesController.text.isEmpty
                                        ? null
                                        : _notesController.text,
                                  );
                                  context.read<AddressCubit>().createAddress(
                                    address,
                                  );
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
