import 'package:flutter/material.dart';

class ListingPageCoachFollowBtn extends StatelessWidget {
  const ListingPageCoachFollowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff434659),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        "Follow",
        style: TextStyle(
          color: Color(0xffDFE1F9),
        ),
      ),
    );
  }
}
