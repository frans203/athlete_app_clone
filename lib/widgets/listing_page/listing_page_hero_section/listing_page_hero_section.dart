import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_action.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_save.dart';
import 'package:star_rating/star_rating.dart';

class ListingPageHeroSection extends StatelessWidget {
  ListingPageHeroSection();

  @override
  Widget build(BuildContext context) {
    dynamic listing = context.read<SingleListingCubit>().state.currentListing;
    dynamic coach =
        context.read<SingleListingCubit>().state.currentCoachListing;
    int currentScore = listing['score'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Text(
                  "Training Plans",
                  style: TextStyle(
                      color: Color(0xffC8C6CA),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MainPage(),
                  //   ),
                  // );
                },
              ),
              Text(
                "${listing['title']}",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xffC8C6CA),
                ),
              ),
              Row(
                children: [
                  StarRating(
                    color: Color(0xFFC6C5D0),
                    rating: currentScore.toDouble(),
                    length: 5,
                    starSize: 16,
                    between: 6,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "$currentScore",
                    style: TextStyle(
                      color: Color(0xFFC6C5D0),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.maxFinite,
                height: 191,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(listing['coverImage']),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            ListingPageHeroAction(
                color: Color(0xffB9C3FF),
                iconData: Icons.share_outlined,
                text: "Share"),
            SizedBox(
              width: 16.0,
            ),
            ListingPageSave(),
          ],
        ),
      ],
    );
  }
}
