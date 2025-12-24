import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/addresses/logic/address_cubit.dart';
import 'package:fashion_flutter/features/addresses/logic/address_state.dart';
import 'package:fashion_flutter/features/addresses/ui/widgets/address_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyAddressesView extends StatelessWidget {
  const MyAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
  print("Building MyAddressesView");
    context.read<AddressCubit>().getAddresses();

    return Scaffold(
      body: Column(
        spacing: verticalSpace,
        children: [
          headerGap(),
          ShoppingAppBar(
            title: "My Addresses",
            horizontal: 10,
            showBackButton: true,
          ),
          Expanded(
            child: BlocConsumer<AddressCubit, AddressState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AddressLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                }
    
                if (state is AddressError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  );
                }
    
                if (state is AddressLoaded) {
                  if (state.addresses.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_off,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No addresses found',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add your first address',
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    );
                  }
    
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.addresses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return AddressCard(address: state.addresses[index]);
                    },
                  );
                }
    
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.pushNamed(addAddressView);
          if (result == true && context.mounted) {
            context.read<AddressCubit>().getAddresses();
          }
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
