import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pod1um_flutter_clone/constants/breakpoints.dart";
import "package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart";
import "package:pod1um_flutter_clone/helper_functions/getInterestLabel.dart";
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_coach_image/listing_page_coach_image.dart';
import "package:responsive_framework/responsive_breakpoints.dart";

class ListingPageHeaderSection extends StatefulWidget {
  const ListingPageHeaderSection({super.key});

  @override
  State<ListingPageHeaderSection> createState() =>
      _ListingPageHeaderSectionState();
}

class _ListingPageHeaderSectionState extends State<ListingPageHeaderSection> {
  @override
  Widget build(BuildContext context) {
    dynamic currentCoach =
        context.read<SingleListingCubit>().state.currentCoachListing;
    List<dynamic> currentTeam = currentCoach['organisations'];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          ListingPageCoachImage(
              imageUrl: context
                  .read<SingleListingCubit>()
                  .state
                  .currentListing['user']['avatarUrl']),
          SizedBox(width: 16),
          Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: ResponsiveBreakpoints.of(context)
                              .largerOrEqualTo(MEDIUM)
                          ? 400
                          : 200,
                      child: Text(
                        "Training plan by ${currentCoach['name']}",
                        style: TextStyle(
                          color: Color(0xffC8C6CA),
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Text(
                      "${getInterestLabel(interest: currentCoach['interest'])}",
                      style:
                          TextStyle(color: Color(0xffC6C5D0), fontSize: 14.0),
                    ),
                    Text(
                      "${currentTeam[currentTeam.length - 1]['name']}",
                      style:
                          TextStyle(color: Color(0xffC6C5D0), fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
