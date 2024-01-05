import 'package:flutter/material.dart';

class ListingJoinModalServiceBtn extends StatelessWidget {
  String serviceTitle;
  IconData serviceIconData;
  double? size;
  ListingJoinModalServiceBtn(
      {required this.serviceIconData, required this.serviceTitle, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                serviceIconData,
                color: Colors.black,
                size: size ?? 24,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Continue with $serviceTitle",
                style: TextStyle(color: Colors.black),
              ),
            ],
          )),
    );
  }
}
