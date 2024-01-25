import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/user/user_cubit.dart';
import "package:pod1um_flutter_clone/repositories/coach_repository.dart";
import "package:pod1um_flutter_clone/repositories/listing_repository.dart";
import 'package:pod1um_flutter_clone/repositories/user_repository.dart';

part "single_coach_state.dart";

class SingleCoachCubit extends Cubit<SingleCoachState> {
  final CoachRepository coachRepository;
  final ListingRepository listingRepository;
  final UserRepository userRepository;
  final UserCubit userCubit;
  SingleCoachCubit({
    required this.listingRepository,
    required this.coachRepository,
    required this.userRepository,
    required this.userCubit,
  }) : super(SingleCoachState.initial());

  Future<void> setCurrentCoachPageData(
      {required int coachId, String? token}) async {
    emit(state.copyWith(singleCoachPageStatus: SingleCoachPageStatus.LOADING));
    try {
      final dynamic coach = await coachRepository.getSingleCoach(id: coachId);
      final dynamic coachListings =
          await coachRepository.getListingsByCoach(coachId: coachId);
      bool? isFollowingCoach = null;
      if (token != null) {
        isFollowingCoach = await coachRepository.isFollowingCoach(
            coachId: coachId, token: token);
        print('coach: ${isFollowingCoach}');
      }
      emit(
        state.copyWith(
            singleCoachPageStatus: SingleCoachPageStatus.LOADED,
            coachListings: coachListings['rows'],
            isFollowingCoach: isFollowingCoach,
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
