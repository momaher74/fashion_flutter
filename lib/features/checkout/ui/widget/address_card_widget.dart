import 'package:flutter/material.dart';
import '../../../addresses/data/model/address_model.dart';

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;

  const AddressCard({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Row(
              children: [
                const Icon(Icons.person, size: 20, color: Colors.black87),
                const SizedBox(width: 8),
                Text(
                  addressModel.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Phone
            Row(
              children: [
                const Icon(Icons.phone, size: 18, color: Colors.black45),
                const SizedBox(width: 8),
                Text(
                  addressModel.phone,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on,
                    size: 18, color: Colors.black45),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${addressModel.street}, ${addressModel.city}, ${addressModel.governorate}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
