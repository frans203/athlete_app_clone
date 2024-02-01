part of "single_listing_cubit.dart";

enum SingleListingStatus {
  LOADING,
  ERROR,
  LOADED,
  INITIAL,
}

class SingleListingState extends Equatable {
  dynamic currentListing;
  dynamic currentCoachListing;
  dynamic currentListingReviews;
  dynamic similarListings;
  bool showAllReviews;
  SingleListingStatus status;
  bool isSavedCurrentListing;

  SingleListingState({
    required this.currentListing,
    required this.currentCoachListing,
    required this.status,
    required this.currentListingReviews,
    required this.showAllReviews,
    required this.isSavedCurrentListing,
    required this.similarListings,
  });

  factory SingleListingState.initial() {
    return SingleListingState(
      currentListing: null,
      currentCoachListing: null,
      currentListingReviews: [],
      similarListings: [],
      status: SingleListingStatus.INITIAL,
      showAllReviews: false,
      isSavedCurrentListing: false,
    );
  }

  @override
  List<Object?> get props => [
        status,
        currentListing,
        currentCoachListing,
        currentListingReviews,
        showAllReviews,
        isSavedCurrentListing,
        similarListings,
      ];

  SingleListingState copyWith({
    dynamic currentListing,
    dynamic currentCoachListing,
    dynamic status,
    dynamic currentListingReviews,
    dynamic similarListings,
    bool? showAllReviews,
    bool? isSavedCurrentListing,
    bool? isFollowingCoach,

  }) {
    return SingleListingState(
      currentCoachListing: currentCoachListing ?? this.currentCoachListing,
      currentListing: currentListing ?? this.currentListing,
      status: status ?? this.status,
      currentListingReviews:
          currentListingReviews ?? this.currentListingReviews,
      showAllReviews: showAllReviews ?? this.showAllReviews,
      isSavedCurrentListing:
          isSavedCurrentListing ?? this.isSavedCurrentListing,
      similarListings: similarListings ?? this.similarListings,
    );
  }
}
