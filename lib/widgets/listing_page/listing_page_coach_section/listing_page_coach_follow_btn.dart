import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/user/user_cubit.dart';

class ListingPageCoachFollowBtn extends StatelessWidget {
  const ListingPageCoachFollowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<LoginCubit>().state.user != null) {
      dynamic coachId =
          context.read<SingleListingCubit>().state.currentCoachListing['id'];
      dynamic token = context.read<LoginCubit>().state.user['token'];
      return FutureBuilder(
          future: context
              .read<UserCubit>()
              .isFollowingCoach(coachId: coachId, token: token),
          builder: (context, snapshot) {
            return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
              print(state.isFollowingCoach);
              if (state.followBtnStatus == FollowBtnStatus.LOADED) {
                return ElevatedButton(
                  onPressed: () async {
                    if (state.isFollowingCoach) {
                      await context.read<UserCubit>().unFollowCoach(
                            coachId: coachId,
                            token: token,
                          );
                    } else {
                      await context.read<UserCubit>().followCoach(
                            coachId: coachId,
                            token: token,
                          );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff434659),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    state.isFollowingCoach ? "Unfollow" : "Follow",
                    style: TextStyle(
                      color: Color(0xffDFE1F9),
                    ),
                  ),
                );
              }
              return Container();
            });
          });
    }

    return Container();
  }
}
