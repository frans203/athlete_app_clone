import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/repositories/listing_repository.dart';

part 'listings_state.dart';

class ListingsCubit extends Cubit<ListingsState> {
  final ListingRepository listingRepository;
  ListingsCubit({required this.listingRepository})
      : super(ListingsState.initial());

  Future<void> fetchListings(
      {int? searchLimit = 10, int? searchPage = 0}) async {
    emit(state.copyWith(listingStatus: ListingStatus.LOADING));

    try {
      final dynamic listings = await listingRepository.getListings(
          searchLimit: searchLimit, searchPage: searchPage);
      emit(
        state.copyWith(
            listingStatus: ListingStatus.LOADED,
            listings: listings,
            searchLimit: searchLimit,
            searchPage: searchPage),
      );
    } catch (error) {
      emit(state.copyWith(listingStatus: ListingStatus.ERROR));
      print(error);
    }
  }

  Future<void> loadMoreListings(
      {int? searchLimit = 10, int? searchPage = 0}) async {
    emit(state.copyWith(listingStatus: ListingStatus.LOADING_MORE_LISTINGS));

    try {
      final dynamic listings = await listingRepository.getListings(
          searchLimit: searchLimit, searchPage: searchPage);
      dynamic listingObject = {};
      if (searchPage != 0) {
        listingObject = {
          'count': listings['count'],
          "rows": [...state.listings['rows'], ...listings['rows']]
        };
      } else if (searchPage == 0) {
        listingObject = listings;
      }
      emit(
        state.copyWith(
            listingStatus: ListingStatus.LOADED_MORE_LISTINGS,
            listings: listingObject,
            searchLimit: searchLimit,
            searchPage: searchPage),
      );
    } catch (error) {
      emit(state.copyWith(listingStatus: ListingStatus.ERROR));
      print(error);
    }
  }
}
