import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/features/addresses/ui/widgets/address_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MyAddressesView extends StatelessWidget {
  const MyAddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        spacing: verticalSpace,
        children: [
          headerGap() ,

          CustomText("My Addresses" , fontSize: size20,fontWeight: bold,),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: addresses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return AddressCard(address: addresses[index]);
              },
            ),
          )


        ],
      ) ,
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.pushNamed(addAddressView);
      } , backgroundColor: Colors.black,child: Icon(Icons.add ,color: Colors.white,),),
    );
  }
}


