import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pages_state.dart';

class PagesCubit extends Cubit<PageState> {
  PagesCubit() : super(PageState.initial()) {}

  void changePage(Pages newPage) {
    emit(state.copyWith(currentPage: newPage));
  }

  void showSearchBar(bool showSearchBar) {
    emit(state.copyWith(showSearchBar: showSearchBar));
  }

  void setEnteredPage(bool enteredPage) {
    emit(state.copyWith(enteredPage: enteredPage));
  }
}
