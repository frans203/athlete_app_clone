part of "user_cubit.dart";

enum FollowBtnStatus {
  LOADED,
  LOADING,
}

class UserState extends Equatable {
  bool isFollowingCoach;
  FollowBtnStatus followBtnStatus;
  UserState({required this.isFollowingCoach, required this.followBtnStatus});

  factory UserState.initial() {
    return UserState(
        isFollowingCoach: false, followBtnStatus: FollowBtnStatus.LOADING);
  }
  List<Object> get props => [isFollowingCoach, followBtnStatus];

  UserState copyWith(
      {bool? isFollowingCoach, FollowBtnStatus? followBtnStatus}) {
    return UserState(
        followBtnStatus: followBtnStatus ?? this.followBtnStatus,
        isFollowingCoach: isFollowingCoach ?? this.isFollowingCoach);
  }
}
