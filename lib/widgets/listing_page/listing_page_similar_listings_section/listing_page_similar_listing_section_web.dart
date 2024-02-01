import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/constants/breakpoints.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listings/listing_card.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ListingPageSimilarListingSectionWeb extends StatefulWidget {
  const ListingPageSimilarListingSectionWeb({super.key});

  @override
  State<ListingPageSimilarListingSectionWeb> createState() =>
      _ListingPageSimilarListingSectionWebState();
}

class _ListingPageSimilarListingSectionWebState
    extends State<ListingPageSimilarListingSectionWeb> {
  int numberOfItems = 1;
  @override
  void didChangeDependencies() {
    if (ResponsiveBreakpoints.of(context).largerOrEqualTo(EXTRA_SMALL)) {
      setState(() {
        numberOfItems = 1;
      });
    }
    if (ResponsiveBreakpoints.of(context).largerOrEqualTo(SMALL)) {
      setState(() {
        numberOfItems = 3;
      });
    }
    if (ResponsiveBreakpoints.of(context).equals(LARGE)) {
      setState(() {
        numberOfItems = 4;
      });
    }
    if (ResponsiveBreakpoints.of(context).largerOrEqualTo(EXTRA_LARGE)) {
      setState(() {
        numberOfItems = 6;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar Training Plans',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xffC8C6CA),
            ),
          ),
          SizedBox(height: 16.0),
          BlocBuilder<SingleListingCubit, SingleListingState>(
            builder: (context, state) => ResponsiveGridList(
                shrinkWrap: true,
                scroll: false,
                desiredItemWidth:
                    (MediaQuery.of(context).size.width / numberOfItems)
                        .toDouble(),
                children: List.generate(
                        state.similarListings['rows'].length, (index) => index)
                    .map((i) => ListingCard(
                          currentItem: state.similarListings['rows'][i],
                        ))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
