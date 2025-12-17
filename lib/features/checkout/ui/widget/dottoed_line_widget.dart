import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DottedLineWidget extends StatelessWidget {
  const DottedLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
      spacing: 10,
      children: [
        const Icon(Icons.location_on_outlined ,size: 25,),

        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            lineThickness: 1,
            dashLength: 4,
            dashGapLength: 4,
          ),
        ),

        const Icon(Icons.credit_card , size: 25,),

        Expanded(
          child: DottedLine(
            direction: Axis.horizontal,
            lineThickness: 1,
            dashLength: 4,
            dashGapLength: 4,
          ),
        ),

        const Icon(Icons.check_circle_outline ,size: 25,),
      ],
    );
  }
}
