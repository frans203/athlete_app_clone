import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:pod1um_flutter_clone/repositories/coach_repository.dart";
import "package:pod1um_flutter_clone/repositories/listing_repository.dart";
import 'package:pod1um_flutter_clone/repositories/user_repository.dart';

part "single_coach_state.dart";

class SingleCoachCubit extends Cubit<SingleCoachState> {
  final CoachRepository coachRepository;
  final ListingRepository listingRepository;
  final UserRepository userRepository;
  SingleCoachCubit({
    required this.listingRepository,
    required this.coachRepository,
    required this.userRepository,
  }) : super(SingleCoachState.initial());

  Future<void> setCurrentCoachPageData(
      {required int coachId, String? token}) async {
    emit(state.copyWith(singleCoachPageStatus: SingleCoachPageStatus.LOADING));
    try {
      final dynamic coach = await coachRepository.getSingleCoach(id: coachId);
      final dynamic coachListings =
          await coachRepository.getListingsByCoach(coachId: coachId);
      emit(
        state.copyWith(
            singleCoachPageStatus: SingleCoachPageStatus.LOADED,
            coachListings: coachListings['rows'],
            currentCoach: coach),
      );
    } catch (error) {
      emit(
        state.copyWith(
            singleCoachPageStatus: SingleCoachPageStatus.ERROR,
            currentCoach: null),
      );
      print(error);
    }
  }

  void invertShowAllTestimonials() {
    emit(state.copyWith(showAllTestimonials: !state.showAllTestimonials));
  }

  void showScrollableTabBar(bool show) {
    emit(state.copyWith(
        showScrollableTabBar: show,
        singleCoachPageStatus: SingleCoachPageStatus.LOADED));
  }
}
