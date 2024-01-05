part of 'listings_cubit.dart';

enum ListingStatus {
  INITIAL,
  LOADING,
  LOADED,
  ERROR,
  LOADING_MORE_LISTINGS,
  LOADED_MORE_LISTINGS,
}

class ListingsState extends Equatable {
  ListingStatus listingStatus;
  dynamic listings;
  int searchPage;
  int searchLimit;

  ListingsState(
      {required this.listingStatus,
      required this.listings,
      required this.searchPage,
      required this.searchLimit});

  factory ListingsState.initial() {
    return ListingsState(
        listingStatus: ListingStatus.INITIAL,
        listings: null,
        searchLimit: 10,
        searchPage: 0);
  }

  @override
  List<Object?> get props => [listingStatus, listings];

  ListingsState copyWith(
      {ListingStatus? listingStatus,
      dynamic? listings,
      int? searchPage,
      int? searchLimit}) {
    return ListingsState(
      listings: listings ?? this.listings,
      listingStatus: listingStatus ?? this.listingStatus,
      searchPage: searchPage ?? this.searchPage,
      searchLimit: searchLimit ?? this.searchLimit,
    );
  }
}
