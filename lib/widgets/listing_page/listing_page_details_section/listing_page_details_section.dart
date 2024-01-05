import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/global/chip/chip.dart';

class ListingPageDetailsSection extends StatelessWidget {
  const ListingPageDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic currentListing =
        context.read<SingleListingCubit>().state.currentListing;
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Details",
            style: TextStyle(color: Color(0xffC8C6CA), fontSize: 22),
          ),
          SizedBox(height: 32.0),
          Row(
            children: [
              ChipComponent(
                text: "${currentListing['trainingPlan']['frequency']}x/week",
              ),
              SizedBox(
                width: 16.0,
              ),
              ChipComponent(
                  text: '${currentListing['trainingPlan']['duration']} '
                      'week${currentListing['trainingPlan']['duration'] > 1 ? "s" : ""}')
            ],
          ),
          SizedBox(height: 32.0),
          Text(
            "${currentListing['description']}",
            style: TextStyle(color: Color(0xffC6C5D0), fontSize: 14),
          )
        ],
      ),
    );
  }
}
