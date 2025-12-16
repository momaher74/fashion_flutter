import 'package:flutter/material.dart';

class ReviewCommentWidget extends StatelessWidget {
  const ReviewCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 310,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            style: TextStyle(
                fontSize: 12
            ),

            cursorColor: Colors.black,
            maxLines: 100,
            maxLength: 100,
            decoration: InputDecoration(
                hintText: "Would you like to write anything about this product? ",

                hintStyle: TextStyle(
                    color: Colors.grey ,
                    fontSize: 10
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                )
            ),
          ),
        ),
      ),


    );
  }
}
