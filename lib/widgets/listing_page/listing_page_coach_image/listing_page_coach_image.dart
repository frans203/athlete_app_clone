import 'package:flutter/material.dart';

class ListingPageCoachImage extends StatelessWidget {
  String imageUrl;
  double? size;
  ListingPageCoachImage({required this.imageUrl, this.size});
  @override
  Widget build(BuildContext context) {
    print(imageUrl);

    return Container(
      height: size ?? 72,
      width: size ?? 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.black),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
