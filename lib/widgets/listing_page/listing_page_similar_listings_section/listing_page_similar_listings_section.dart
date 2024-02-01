import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listings/listing_card.dart';

class ListingPageSimilarListingsSection extends StatelessWidget {
  const ListingPageSimilarListingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Similar Training Plans",
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
          SizedBox(
            height: 34.0,
          ),
          BlocBuilder<SingleListingCubit, SingleListingState>(
            builder: (context, state) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (int i = 0;
                        i < state.similarListings['rows'].length;
                        i++)
                      ListingCard(currentItem: state.similarListings['rows'][i])
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
