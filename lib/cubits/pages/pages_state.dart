part of 'pages_cubit.dart';

enum Pages { HOME, EXPLORE, FEED, LIBRARY }

class PageState extends Equatable {
  Pages currentPage;
  bool showSearchBar;
  bool enteredPage;

  PageState(
      {required this.currentPage,
      required this.showSearchBar,
      required this.enteredPage});

  factory PageState.initial() {
    return PageState(
        currentPage: Pages.HOME, showSearchBar: true, enteredPage: true);
  }

  @override
  List<Object?> get props => [currentPage, showSearchBar, enteredPage];

  PageState copyWith(
      {Pages? currentPage, bool? showSearchBar, bool? enteredPage}) {
    return PageState(
        enteredPage: enteredPage ?? this.enteredPage,
        currentPage: currentPage ?? this.currentPage,
        showSearchBar: showSearchBar ?? this.showSearchBar);
  }
}
