import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/helper_functions/getInterestLabel.dart';

class CoachPageDetailsSection extends StatelessWidget {
  const CoachPageDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic currentCoach = context.read<SingleCoachCubit>().state.currentCoach;
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            "About",
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${getInterestLabel(interest: currentCoach['interest'])}",
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xffB3B3B3),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "${currentCoach['bio']}",
            style: TextStyle(
              color: Color(0xffB3B3B3),
            ),
          )
        ],
      ),
    );
  }
}
