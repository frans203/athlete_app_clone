import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/listings/listings_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listings/listing_card.dart';
import 'package:pod1um_flutter_clone/widgets/listings/load_more.dart';

class TrainingPlansView extends StatefulWidget {
  const TrainingPlansView({super.key});

  @override
  State<TrainingPlansView> createState() => _TrainingPlansViewState();
}

class _TrainingPlansViewState extends State<TrainingPlansView> {
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
            FutureBuilder(
                future: context.read<ListingsCubit>().fetchListings(),
                builder: (context, snapshot) {
                  return BlocBuilder<ListingsCubit, ListingsState>(
                      builder: (context, state) {
                    if (state.listingStatus == ListingStatus.LOADING) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.listingStatus == ListingStatus.LOADED ||
                        state.listingStatus ==
                            ListingStatus.LOADED_MORE_LISTINGS ||
                        state.listingStatus ==
                            ListingStatus.LOADING_MORE_LISTINGS) {
                      return Container(
                          // height: MediaQuery.of(context).size.height * 0.85,
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (int i = 0;
                                  i < state.listings['rows'].length;
                                  i++)
                                ListingCard(
                                    currentItem: state.listings["rows"][i]),
                              state.listings['count'] >
                                      state.listings['rows'].length
                                  ? LoadMoreBtn()
                                  : Container(),
                            ],
                          ));
                    } else {
                      return Container();
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}
