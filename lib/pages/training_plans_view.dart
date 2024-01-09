import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/listings/listings_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listings/listing_card.dart';
import 'package:pod1um_flutter_clone/widgets/listings/load_more.dart';

class TrainingPlansView extends StatelessWidget {
  const TrainingPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Training Plans",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 34,
            ),
            BlocBuilder<ListingsCubit, ListingsState>(
                builder: (context, state) {
              print("status listings");
              print(state.listingStatus);
              if (state.listingStatus == ListingStatus.LOADING) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.listingStatus == ListingStatus.LOADED ||
                  state.listingStatus == ListingStatus.LOADED_MORE_LISTINGS ||
                  state.listingStatus == ListingStatus.LOADING_MORE_LISTINGS) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.2),
                  child: ListView.builder(
                    itemCount: state.listings['rows'].length + 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      if (index == state.listings['rows'].length &&
                          state.listings['count'] >
                              state.listings['rows'].length) {
                        return LoadMoreBtn();
                      } else if (index < state.listings['rows'].length) {
                        final currentItem = state.listings['rows'][index];
                        return ListingCard(currentItem: currentItem);
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
