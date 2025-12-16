import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/features/addresses/ui/update_address_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/model/address_model.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.address});

  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Name + Phone
          Row(
            children: [
              const Icon(Icons.person, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  address.username,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                address.phoneNumber,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Address
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${address.street}, ${address.city}, ${address.state}\n${address.zipCode}',
                  style: TextStyle(color: Colors.grey.shade700, height: 1.4),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// Actions
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  push(context: context, widget: UpdateAddressView(addressModel: address) ) ;
                },
                child: Row(
                  children: [
                    Icon(Icons.edit, color: Colors.black, size: 14),
                    Gap(8),
                    CustomText('Edit'),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                title: "select",
                width: 70,
                height: 40,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
