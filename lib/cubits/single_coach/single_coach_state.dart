part of "single_coach_cubit.dart";

enum SingleCoachPageStatus {
  INITIAL,
  LOADING,
  LOADED,
  ERROR,
}

class SingleCoachState extends Equatable {
  dynamic currentCoach;
  SingleCoachPageStatus singleCoachPageStatus;
  bool showAllTestimonials;
  bool showScrollableTabBar;
  List<dynamic> coachListings;
  bool isFollowingCoach;
  SingleCoachState({
    required this.currentCoach,
    required this.singleCoachPageStatus,
    required this.showAllTestimonials,
    required this.coachListings,
    required this.showScrollableTabBar,
    required this.isFollowingCoach,
  });
  factory SingleCoachState.initial() {
    return SingleCoachState(
        currentCoach: null,
        singleCoachPageStatus: SingleCoachPageStatus.INITIAL,
        showAllTestimonials: false,
        showScrollableTabBar: false,
        isFollowingCoach: false,
        coachListings: []);
  }

  @override
  List<Object?> get props => [
        currentCoach,
        singleCoachPageStatus,
        showAllTestimonials,
        coachListings,
        showScrollableTabBar,
        isFollowingCoach,
      ];

  @override
  String toString() {
    return 'SingleCoachState{currentCoach: $currentCoach, singleCoachPageStatus: $singleCoachPageStatus, showAllTestimonials: $showAllTestimonials, coachListings: $coachListings}';
  }

  SingleCoachState copyWith({
    dynamic currentCoach,
    SingleCoachPageStatus? singleCoachPageStatus,
    bool? showAllTestimonials,
    List<dynamic>? coachListings,
    bool? showScrollableTabBar,
    bool? isFollowingCoach,
  }) {
    return SingleCoachState(
      showAllTestimonials: showAllTestimonials ?? this.showAllTestimonials,
      currentCoach: currentCoach ?? this.currentCoach,
      singleCoachPageStatus:
          singleCoachPageStatus ?? this.singleCoachPageStatus,
      coachListings: coachListings ?? this.coachListings,
      showScrollableTabBar: showScrollableTabBar ?? this.showScrollableTabBar,
      isFollowingCoach: isFollowingCoach ?? this.isFollowingCoach,
    );
  }
}
