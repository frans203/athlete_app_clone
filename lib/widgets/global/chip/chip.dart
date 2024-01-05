import 'package:flutter/material.dart';

class ChipComponent extends StatelessWidget {
  String text;
  ChipComponent({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xff1B1B1F),
      ),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Text(
        "$text",
        style: TextStyle(
          fontSize: 14,
          color: Color(0xffC8C6CA),
        ),
      ),
    );
  }
}
