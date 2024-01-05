import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/constants/constants.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_reviews_section/listing_review.dart';

class ListingReviewsSection extends StatefulWidget {
  ListingReviewsSection();

  @override
  State<ListingReviewsSection> createState() => _ListingReviewsSectionState();
}

class _ListingReviewsSectionState extends State<ListingReviewsSection> {
  @override
  Widget build(BuildContext context) {
    dynamic currentListing =
        context.read<SingleListingCubit>().state.currentListing;
    // List<dynamic> currentReviews =
    //     context.read<SingleListingCubit>().state.currentListingReviews;
    List<dynamic> currentReviews = [...reviewsMock];
    print(currentReviews);

    return currentReviews.length > 0
        ? Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                              fontSize: 22.0, color: Color(0xffC8C6CA)),
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          "${currentListing["score"]}",
                          style: TextStyle(
                              color: Color(0xffC6C5D0), fontSize: 16.0),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Text(
                      "${currentListing['reviews']} reviews",
                      style:
                          TextStyle(color: Color(0xffC6C5D0), fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.0,
                ),
                BlocBuilder<SingleListingCubit, SingleListingState>(
                    builder: (context, state) {
                  return Column(
                    children: [
                      currentReviews.length > MAX_REVIEWS
                          ? Column(
                              children: [
                                for (var i = 0;
                                    currentReviews.length > MAX_REVIEWS &&
                                            !state.showAllReviews
                                        ? i < MAX_REVIEWS
                                        : i < currentReviews.length;
                                    i++)
                                  ListingReview(data: currentReviews[i]),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<SingleListingCubit>()
                                        .invertShowAllReviews();
                                  },
                                  child: Text(
                                    state.showAllReviews
                                        ? "See less reviews"
                                        : "See all ${currentReviews.length} reviews",
                                    style: TextStyle(
                                      color: Color(0xffB9C3FF),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  );
                })
              ],
            ),
          )
        : Container();
  }
}
