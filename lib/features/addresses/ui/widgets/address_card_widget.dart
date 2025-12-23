import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/features/addresses/logic/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
            color: Colors.black.withValues(alpha: 0.05),
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
                  address.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                address.phone,
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
                  '${address.street}, ${address.city}, ${address.governorate}',
                  style: TextStyle(color: Colors.grey.shade700, height: 1.4),
                ),
              ),
            ],
          ),

          if (address.notes != null && address.notes!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.note_outlined, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    address.notes!,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 16),

          /// Actions
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.pushNamed(editAddressView, extra: address);
                },
                child: Row(
                  children: [
                    Icon(Icons.edit, color: Colors.black, size: 14),
                    Gap(8),
                    CustomText('Edit'),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  _showDeleteDialog(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, color: Colors.red, size: 14),
                    Gap(8),
                    CustomText('Delete', color: Colors.red),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                title: "select",
                width: 70,
                height: 40,
                fontSize: 12,
                horizontal: 0,
                onTap: () {
                  context.pushNamed(orderPlacedView);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Address'),
        content: const Text('Are you sure you want to delete this address?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              if (address.id != null) {
                context.read<AddressCubit>().deleteAddress(address.id!);
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
