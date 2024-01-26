import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/repositories/user_repository.dart';

part "user_state.dart";

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository;
  UserCubit({required this.userRepository}) : super(UserState.initial());

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

  Future<void> isFollowingCoach(
      {required int coachId, required String token}) async {
    emit(state.copyWith(followBtnStatus: FollowBtnStatus.LOADING));
    try {
      bool? isFollowingCoach =
          await userRepository.isFollowingCoach(coachId: coachId, token: token);
      emit(state.copyWith(
          followBtnStatus: FollowBtnStatus.LOADED,
          isFollowingCoach: isFollowingCoach));
    } catch (error) {
      emit(state.copyWith(followBtnStatus: FollowBtnStatus.LOADED));
      print(error);
    }
  }
}
