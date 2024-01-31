import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/constants/constants.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_reviews_section/listing_review.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ListingReviewsSectionWeb extends StatelessWidget {
  const ListingReviewsSectionWeb({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic currentListing =
        context.read<SingleListingCubit>().state.currentListing;
    // List<dynamic> currentReviews =
    //     context.read<SingleListingCubit>().state.currentListingReviews;
    List<dynamic> currentReviews = [...reviewsMock];

    return Container(
      padding: EdgeInsets.only(top: 32),
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
                      fontSize: 22.0,
                      color: Color(0xffC8C6CA),
                    ),
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
                    style: TextStyle(color: Color(0xffC6C5D0), fontSize: 16.0),
                  )
                ],
              ),
              SizedBox(
                height: 32.0,
              ),
              BlocBuilder<SingleListingCubit, SingleListingState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: state.showAllReviews
                            ? 200.0 * (currentReviews.length / 2)
                            : 200,
                        child: ResponsiveGridList(
                            desiredItemWidth:
                                MediaQuery.of(context).size.width * 0.7 / 3,
                            children: List.generate(
                                    currentReviews.length, (index) => index)
                                .map((i) {
                              if (currentReviews.length > MAX_REVIEWS &&
                                  !state.showAllReviews &&
                                  i >= MAX_REVIEWS) {
                                return Container();
                              }
                              return ListingReview(data: currentReviews[i]);
                            }).toList()),
                      ),
                      currentReviews.length > MAX_REVIEWS
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffB9C3FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              onPressed: () {
                                context
                                    .read<SingleListingCubit>()
                                    .invertShowAllReviews();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  state.showAllReviews
                                      ? "See less reviews"
                                      : "See all ${currentReviews.length} reviews",
                                  style: TextStyle(
                                      color: Color(0xff00218C), fontSize: 16),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
