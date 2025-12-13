import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 5,
              color: Colors.white,
              child:   TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          Gap(8),
          SizedBox(
            height: 70,
            width: 70,
            child: Card(
              elevation: 5,

              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  PhosphorIcons.faders(),
                  size: 25,
                  color: Colors.black,
                )
              ),
            ),
          ),
          Gap(10)
        ],
      ),
    );
  }
}
