import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/repositories/user_repository.dart';

import '../../repositories/coach_repository.dart';
import "../../repositories/listing_repository.dart";

part "single_listing_state.dart";

class SingleListingCubit extends Cubit<SingleListingState> {
  final CoachRepository coachRepository;
  final ListingRepository listingRepository;
  final UserRepository userRepository;
  SingleListingCubit(
      {required this.coachRepository,
      required this.listingRepository,
      required this.userRepository})
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
      {required int id, String? token}) async {
    emit(state.copyWith(
        currentListing: null,
        status: SingleListingStatus.LOADING,
        currentCoachListing: null));
    try {
      final dynamic currentListing = await listingRepository.getListing(id: id);
      var promises = await Future.wait([
        coachRepository.getSingleCoach(id: currentListing['user']['id']),
        listingRepository.getListingReviews(listingId: currentListing['id']),
        listingRepository.getListings()
      ]);
      print("SIMILAR LISTINGS");
      print(promises[2]);
      bool? isFollowingCoach = null;
      emit(
        state.copyWith(
            status: SingleListingStatus.LOADED,
            currentCoachListing: promises[0],
            currentListing: currentListing,
            currentListingReviews: promises[1],
            showAllReviews: false,
            isFollowingCoach: isFollowingCoach,
            similarListings: promises[2]),
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

  Future<void> followCoach(
      {required int coachId, required String token}) async {
    emit(state.copyWith(isFollowingCoach: true));
    try {
      await userRepository.followCoach(coachId: coachId, token: token);
    } catch (error) {
      print(error);
    }
  }

  Future<void> unFollowCoach(
      {required int coachId, required String token}) async {
    emit(state.copyWith(isFollowingCoach: false));
    try {
      await userRepository.unFollowCoach(coachId: coachId, token: token);
    } catch (error) {
      print(error);
    }
  }
}
