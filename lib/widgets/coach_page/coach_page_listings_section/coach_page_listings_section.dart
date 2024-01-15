import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listings/listing_card.dart';

class CoachPageListingsSection extends StatelessWidget {
  const CoachPageListingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> coachListings =
        context.read<SingleCoachCubit>().state.coachListings;
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Training Plans",
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
          SizedBox(
            height: 34.0,
          ),
          BlocBuilder<SingleCoachCubit, SingleCoachState>(
            builder: (context, state) {
              return Container(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0; i < state.coachListings.length; i++)
                      ListingCard(currentItem: coachListings[i])
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
