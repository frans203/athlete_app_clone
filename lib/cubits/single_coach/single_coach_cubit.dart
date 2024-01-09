import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:pod1um_flutter_clone/repositories/coach_repository.dart";
import "package:pod1um_flutter_clone/repositories/listing_repository.dart";

part "single_coach_state.dart";

class SingleCoachCubit extends Cubit<SingleCoachState> {
  final CoachRepository coachRepository;
  final ListingRepository listingRepository;
  SingleCoachCubit(
      {required this.listingRepository, required this.coachRepository})
      : super(SingleCoachState.initial());

  Future<void> setCurrentCoachPageData({required int coachId}) async {
    emit(state.copyWith(singleCoachPageStatus: SingleCoachPageStatus.LOADING));
    try {
      final dynamic coach = await coachRepository.getSingleCoach(id: coachId);
      emit(
        state.copyWith(
            singleCoachPageStatus: SingleCoachPageStatus.LOADED,
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
}
