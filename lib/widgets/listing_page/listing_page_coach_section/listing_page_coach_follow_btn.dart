import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';

class ListingPageCoachFollowBtn extends StatelessWidget {
  const ListingPageCoachFollowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleListingCubit, SingleListingState>(
      builder: (context, listingState) =>
          BlocBuilder<LoginCubit, LoginState>(builder: (context, loginState) {
        if (loginState.user != null) {
          return ElevatedButton(
            onPressed: () {
              dynamic coachId = context
                  .read<SingleListingCubit>()
                  .state
                  .currentCoachListing['id'];
              dynamic token = context.read<LoginCubit>().state.user['token'];
              if (listingState.isFollowingCoach) {
                context.read<SingleListingCubit>().unFollowCoach(
                      coachId: coachId,
                      token: token,
                    );
              } else {
                context.read<SingleListingCubit>().followCoach(
                      coachId: coachId,
                      token: token,
                    );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff434659),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              listingState.isFollowingCoach ? "Unfollow" : "Follow",
              style: TextStyle(
                color: Color(0xffDFE1F9),
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
