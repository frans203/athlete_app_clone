import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/helper_functions/isNewCoach.dart';

class CoachPageIsNew extends StatelessWidget {
  const CoachPageIsNew({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic currentCoach = context.read<SingleCoachCubit>().state.currentCoach;
    bool isNewCoachFlag = isNewCoach(currentCoach['created_at']);

    if (isNewCoachFlag) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xff5D3C55),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "New",
          style: TextStyle(
            color: Color(0xffFFD7F2),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
