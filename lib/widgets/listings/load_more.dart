import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/listings/listings_cubit.dart';

class LoadMoreBtn extends StatefulWidget {
  const LoadMoreBtn({super.key});

  @override
  State<LoadMoreBtn> createState() => _LoadMoreBtnState();
}

class _LoadMoreBtnState extends State<LoadMoreBtn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListingsCubit, ListingsState>(
      builder: (context, state) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Opacity(
          opacity: state.listingStatus == ListingStatus.LOADING_MORE_LISTINGS
              ? 0.5
              : 1,
          child: ElevatedButton(
            onPressed: () {
              if (state.listingStatus == ListingStatus.LOADING_MORE_LISTINGS) {
                return null;
              } else {
                int currentPage = state.searchPage;
                context
                    .read<ListingsCubit>()
                    .loadMoreListings(searchPage: currentPage + 1);
              }
            },
            child: Text("Load More",
                style: TextStyle(
                  color: Color(0xff00218C),
                )),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffB9C3FF)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
          ),
        ),
      ),
    );
  }
}
