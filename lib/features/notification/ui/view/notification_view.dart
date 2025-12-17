import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/notification/ui/view/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        spacing: verticalSpace,
        children: [
          headerGap() ,
          ShoppingAppBar(title: "Notification") ,
         Expanded(
           child: ListView.separated(
               padding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
               itemBuilder: (context , index){
             return NotificationItemWidget();
           }, separatorBuilder: (context , index){
             return Gap(10) ;
           }, itemCount: 12),
         ),



        ],
      ),
    );
  }
}
