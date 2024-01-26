part of "user_cubit.dart";

enum FollowBtnStatus {
  LOADED,
  LOADING,
}

enum SaveWishlistBtnStatus {
  LOADED,
  LOADING,
}

class UserState extends Equatable {
  bool isFollowingCoach;
  bool isSavedWhishlist;
  FollowBtnStatus followBtnStatus;
  SaveWishlistBtnStatus saveWishlistBtnStatus;

  UserState({
    required this.isFollowingCoach,
    required this.followBtnStatus,
    required this.isSavedWhishlist,
    required this.saveWishlistBtnStatus,
  });

  factory UserState.initial() {
    return UserState(
        isFollowingCoach: false,
        followBtnStatus: FollowBtnStatus.LOADING,
        saveWishlistBtnStatus: SaveWishlistBtnStatus.LOADING,
        isSavedWhishlist: false);
  }
  List<Object> get props => [
        isFollowingCoach,
        followBtnStatus,
        isSavedWhishlist,
        saveWishlistBtnStatus
      ];

  UserState copyWith({
    bool? isFollowingCoach,
    FollowBtnStatus? followBtnStatus,
    bool? isSavedWhishlist,
    SaveWishlistBtnStatus? saveWishlistBtnStatus,
  }) {
    return UserState(
      saveWishlistBtnStatus:
          saveWishlistBtnStatus ?? this.saveWishlistBtnStatus,
      followBtnStatus: followBtnStatus ?? this.followBtnStatus,
      isSavedWhishlist: isSavedWhishlist ?? this.isSavedWhishlist,
      isFollowingCoach: isFollowingCoach ?? this.isFollowingCoach,
    );
  }
}
