import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/coach_repository.dart';
import "../../repositories/listing_repository.dart";

part "single_listing_state.dart";

class SingleListingCubit extends Cubit<SingleListingState> {
  final CoachRepository coachRepository;
  final ListingRepository listingRepository;
  SingleListingCubit(
      {required this.coachRepository, required this.listingRepository})
      : super(SingleListingState.initial());
  void setCurrentListing({dynamic currentListing}) {
    emit(state.copyWith(currentListing: currentListing));
  }

  void setInitialStatePage() {
    emit(state.copyWith(status: SingleListingStatus.LOADING));
  }

  Future<void> setCurrentListingCoach({required int id}) async {
    emit(state.copyWith(
        status: SingleListingStatus.LOADING, currentCoachListing: null));
    try {
      final dynamic coach = await coachRepository.getSingleCoach(id: id);
      emit(
        state.copyWith(
            status: SingleListingStatus.LOADED, currentCoachListing: coach),
      );
    } catch (error) {
      emit(state.copyWith(
          status: SingleListingStatus.ERROR, currentCoachListing: null));
      print(error);
    }
  }

  Future<void> setCurrentListingPageData(
      {required int coachId, dynamic currentListing}) async {
    emit(state.copyWith(
        status: SingleListingStatus.LOADING, currentCoachListing: null));
    try {
      final dynamic coach = await coachRepository.getSingleCoach(id: coachId);
      final dynamic listingReviews = await listingRepository.getListingReviews(
          listingId: currentListing['id']);
      emit(
        state.copyWith(
          status: SingleListingStatus.LOADED,
          currentCoachListing: coach,
          currentListing: currentListing,
          currentListingReviews: listingReviews,
          showAllReviews: false,
        ),
      );
    } catch (error) {
      emit(state.copyWith(
          status: SingleListingStatus.ERROR, currentCoachListing: null));
      print(error);
    }
  }

  void invertShowAllReviews() {
    bool showAllReviewsValue = !state.showAllReviews;
    emit(
      state.copyWith(showAllReviews: showAllReviewsValue),
    );
  }
}
