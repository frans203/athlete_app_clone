import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_action.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_save.dart';
import 'package:share_plus/share_plus.dart';
import 'package:star_rating/star_rating.dart';

class ListingPageHeroSection extends StatefulWidget {
  ListingPageHeroSection();

  @override
  State<ListingPageHeroSection> createState() => _ListingPageHeroSectionState();
}

class _ListingPageHeroSectionState extends State<ListingPageHeroSection> {
  String? errorImage = null;

  @override
  Widget build(BuildContext context) {
    dynamic listing = context.read<SingleListingCubit>().state.currentListing;
    var router = AutoRouter.of(context);
    int currentScore = listing['score'];

    Future<void> shareFunction() async {
      try {
        await Share.share("Text");
      } catch (error) {
        print(error);
      }
    }

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
                  router.push(Explore());
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
            ],
          ),
        ),
        Row(
          children: [
            ListingPageHeroAction(
                action: shareFunction,
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
