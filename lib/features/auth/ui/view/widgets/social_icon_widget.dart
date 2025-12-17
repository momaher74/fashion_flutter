import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withValues(alpha: .2)),
      ),
      child: type == "apple"?Icon(PhosphorIcons.appleLogo(), size: 30.0) : Icon(PhosphorIcons.googleLogo(), size: 30.0 ,color: Colors.black,),
    );
  }


}
