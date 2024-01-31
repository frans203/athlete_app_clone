import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';

class ListingPageCoverImage extends StatefulWidget {
  const ListingPageCoverImage({super.key});

  @override
  State<ListingPageCoverImage> createState() => _ListingPageCoverImageState();
}

class _ListingPageCoverImageState extends State<ListingPageCoverImage> {
  String? errorImage = null;
  @override
  Widget build(BuildContext context) {
    dynamic listing = context.read<SingleListingCubit>().state.currentListing;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        // width: 721,
        // height: 405,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: errorImage != null
                  ? AssetImage(errorImage!) as ImageProvider<Object>
                  : NetworkImage(listing['coverImage']),
              onError: (error, trace) {
                setState(() {
                  errorImage = "assets/images/pre-season-cycle.png";
                });
              }),
        ),
      ),
    );
  }
}
