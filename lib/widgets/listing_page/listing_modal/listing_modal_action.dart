import 'package:flutter/material.dart';

class ListingModalAction extends StatelessWidget {
  String text;
  ListingModalAction({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffB9C3FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            )),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xff00218C),
          ),
        ),
      ),
    );
  }
}
