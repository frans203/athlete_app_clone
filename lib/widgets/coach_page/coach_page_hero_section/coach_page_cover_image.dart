import 'package:flutter/material.dart';

class CoachPageCoverImage extends StatelessWidget {
  String imageUrl;
  CoachPageCoverImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
