part of 'pages_cubit.dart';

enum Pages { HOME, EXPLORE, FEED, LIBRARY }

class PageState extends Equatable {
  Pages currentPage;

  PageState({required this.currentPage});

  factory PageState.initial() {
    return PageState(currentPage: Pages.EXPLORE);
  }

  @override
  List<Object?> get props => [currentPage];

  PageState copyWith({Pages? currentPage}) {
    return PageState(currentPage: currentPage ?? this.currentPage);
  }
}
