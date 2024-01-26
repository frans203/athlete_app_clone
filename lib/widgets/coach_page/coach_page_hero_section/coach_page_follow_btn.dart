import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/user/user_cubit.dart';

class CoachPageFollowBtn extends StatelessWidget {
  const CoachPageFollowBtn({super.key});

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
            return BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state.followBtnStatus == FollowBtnStatus.LOADED) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                      backgroundColor: Color(0xff2B4EDE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
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
                    child: Text(
                      state.isFollowingCoach ? "Unfollow" : "Follow",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffDFE1F9),
                      ),
                    ),
                  );
                }
                return Container();
              },
            );
          });
    }

    return Container();
  }
}
