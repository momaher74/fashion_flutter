import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SharedAppBar extends StatelessWidget {
  const SharedAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
           PhosphorIcon(
            PhosphorIcons.list(),
            color: Colors.black,
            size: size30,
          ),
          Spacer() ,
         CustomText(
            'Fashion',
            fontSize: size20,
            fontWeight:bold,
      
      
          ),
          Spacer() ,
          PhosphorIcon(
            PhosphorIcons.bell(),
            color: Colors.black,
            size: size30,
          ),
        ],
      ),
    );
  }
}
