import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/helper_functions/shareFunction.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_action.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_save.dart';
import 'package:star_rating/star_rating.dart';

class ListingPageHeroSectionWeb extends StatelessWidget {
  const ListingPageHeroSectionWeb({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic listing = context.read<SingleListingCubit>().state.currentListing;
    int currentScore = listing['score'];
    var router = AutoRouter.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
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
          ],
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
