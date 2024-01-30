import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/listings/listings_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listings/listing_card.dart';
import 'package:pod1um_flutter_clone/widgets/listings/load_more.dart';

class ListingsPageColumn extends StatelessWidget {
  const ListingsPageColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListingsCubit, ListingsState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < state.listings['rows'].length; i++)
            ListingCard(currentItem: state.listings["rows"][i]),
          state.listings['count'] > state.listings['rows'].length
              ? LoadMoreBtn()
              : Container(),
        ],
      ),
    );
  }
}
