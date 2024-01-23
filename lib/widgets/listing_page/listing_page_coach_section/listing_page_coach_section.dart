import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/helper_functions/getInterestLabel.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_coach_image/listing_page_coach_image.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_coach_section/listing_page_coach_follow_btn.dart';
import 'package:star_rating/star_rating.dart';

class ListingPageCoachSection extends StatelessWidget {
  ListingPageCoachSection({super.key});

  @override
  Widget build(BuildContext context) {
    var router = AutoRouter.of(context);
    dynamic currentCoach =
        context.read<SingleListingCubit>().state.currentCoachListing;
    int currentScore = currentCoach['score'];
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Color(0xff2A2A2D),
          ),
        ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListingPageCoachImage(
                size: 96,
                imageUrl: currentCoach['avatarUrl'],
              ),
              Container(
                child: ListingPageCoachFollowBtn(),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            currentCoach['name'],
            style: TextStyle(
              fontSize: 35,
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
                width: 4.0,
              ),
              Text(
                "${currentCoach['trainingsCompleted']} workouts",
                style: TextStyle(color: Color(0xffC6C5D0)),
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "About",
            style: TextStyle(
              fontSize: 22.0,
              color: Color(0xffC8C6CA),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "${getInterestLabel(interest: currentCoach['interest'])} Coach",
            style: TextStyle(
              color: Color(0xffB3B3B3),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "${currentCoach['bio']}",
            style: TextStyle(
              color: Color(0xffB3B3B3),
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          InkWell(
            onTap: () {
              router.push(Coach(coachId: currentCoach['id']));
              print(context.router.current.name);
            },
            child: Text(
              "View Full Profile",
              style: TextStyle(color: Color(0xffB9C3FF), fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}
