import 'package:flutter/material.dart';

class ListingPageHeroAction extends StatelessWidget {
  Color color;
  String text;
  IconData iconData;
  ListingPageHeroAction(
      {required this.color, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ))),
      child: Row(
        children: [
          Icon(iconData, color: color),
          SizedBox(
            width: 8,
          ),
          Text(
            "$text",
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
