import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';

class CoachPageFollowBtn extends StatelessWidget {
  const CoachPageFollowBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleCoachCubit, SingleCoachState>(
      builder: (context, coachState) =>
          BlocBuilder<LoginCubit, LoginState>(builder: (context, loginState) {
        if (loginState.user != null) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              backgroundColor: Color(0xff2B4EDE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              dynamic coachId = context
                  .read<SingleCoachCubit>()
                  .state
                  .currentCoach['id'];
              dynamic token = context.read<LoginCubit>().state.user['token'];
              if (coachState.isFollowingCoach) {
                context.read<SingleCoachCubit>().unFollowCoach(
                  coachId: coachId,
                  token: token,
                );
              } else {
                context.read<SingleCoachCubit>().followCoach(
                  coachId: coachId,
                  token: token,
                );
              }
            },
            child: Text(
              coachState.isFollowingCoach ? "Unfollow" : "Follow",
              style: TextStyle(
                fontSize: 14,
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
