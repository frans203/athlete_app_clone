import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/constants/breakpoints.dart';
import 'package:pod1um_flutter_clone/cubits/listings/listings_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listings/listing_card.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ListingsPageGrid extends StatefulWidget {
  ListingsPageGrid({super.key});

  @override
  State<ListingsPageGrid> createState() => _ListingsPageGridState();
}

class _ListingsPageGridState extends State<ListingsPageGrid> {
  int numberOfItems = 1;
  @override
  void didChangeDependencies() {
    if (ResponsiveBreakpoints.of(context).largerOrEqualTo(EXTRA_SMALL)) {
      setState(() {
        numberOfItems = 1;
      });
    }
    if (ResponsiveBreakpoints.of(context).largerOrEqualTo(MEDIUM)) {
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

    print(numberOfItems);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListingsCubit, ListingsState>(
      listener: (context, state) {},
      builder: (context, state) => SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: ResponsiveGridList(
              desiredItemWidth:
                  (MediaQuery.of(context).size.width / numberOfItems)
                      .toDouble(),
              minSpacing: 10,
              children:
                  List.generate(state.listings['rows'].length, (index) => index)
                      .map((i) {
                return ListingCard(currentItem: state.listings['rows'][i]);
              }).toList()),
        ),
      ),
    );
  }
}
