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
  SingleCoachState({
    required this.currentCoach,
    required this.singleCoachPageStatus,
    required this.showAllTestimonials,
  });
  factory SingleCoachState.initial() {
    return SingleCoachState(
      currentCoach: null,
      singleCoachPageStatus: SingleCoachPageStatus.INITIAL,
      showAllTestimonials: false,
    );
  }

  @override
  List<Object?> get props =>
      [currentCoach, singleCoachPageStatus, showAllTestimonials];

  @override
  String toString() {
    return 'SingleCoachState{currentCoach: $currentCoach, singleCoachPageStatus: $singleCoachPageStatus}';
  }

  SingleCoachState copyWith(
      {dynamic currentCoach,
      SingleCoachPageStatus? singleCoachPageStatus,
      bool? showAllTestimonials}) {
    return SingleCoachState(
        showAllTestimonials: showAllTestimonials ?? this.showAllTestimonials,
        currentCoach: currentCoach ?? this.currentCoach,
        singleCoachPageStatus:
            singleCoachPageStatus ?? this.singleCoachPageStatus);
  }
}
