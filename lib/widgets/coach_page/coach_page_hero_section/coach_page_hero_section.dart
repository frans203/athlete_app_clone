import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/coach_page_cover_image.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/coach_page_isNew.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/coach_page_share_follow.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_coach_image/listing_page_coach_image.dart';
import 'package:star_rating/star_rating.dart';

class CoachPageHeroSection extends StatefulWidget {
  CoachPageHeroSection();

  @override
  State<CoachPageHeroSection> createState() => _CoachPageHeroSectionState();
}

class _CoachPageHeroSectionState extends State<CoachPageHeroSection>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    dynamic currentCoach = context.read<SingleCoachCubit>().state.currentCoach;
    int currentScore = currentCoach['score'];

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 340,
            child: Stack(
              children: [
                CoachPageCoverImage(imageUrl: currentCoach['coverUrl']),
                Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width / 2 - 60,
                  child: ListingPageCoachImage(
                    imageUrl: currentCoach['avatarUrl'],
                    size: 128,
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 12,
                  child: CoachPageShareFollow(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            child: Text(
              "${currentCoach['name']}",
              style: TextStyle(
                fontSize: 32,
                color: Color(0xffC8C6CA),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StarRating(
                color: Color(0xFFC6C5D0),
                rating: currentScore.toDouble(),
                length: 5,
                starSize: 16,
                between: 6,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                "${currentCoach['trainingsCompleted']} workouts",
                style: TextStyle(color: Color(0xFFC6C5D0), fontSize: 14.0),
              ),
              SizedBox(
                width: 4,
              ),
              CoachPageIsNew(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
