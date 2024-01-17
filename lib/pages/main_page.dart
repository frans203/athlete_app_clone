import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/pages/explore_page.dart';
import 'package:pod1um_flutter_clone/pages/feed_page.dart';
import 'package:pod1um_flutter_clone/pages/home_page.dart';
import 'package:pod1um_flutter_clone/pages/library_page.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: PreferredSize(
          child: SafeArea(
            child: SearchTopBar(),
          ),
          preferredSize: Size.fromHeight(55)),
      body: WillPopScope(
        onWillPop: () async => false,
        child: BlocBuilder<PagesCubit, PageState>(builder: (context, state) {
          if (state.currentPage == Pages.HOME) {
            return HomePage();
          } else if (state.currentPage == Pages.EXPLORE) {
            return ExplorePage();
          } else if (state.currentPage == Pages.FEED) {
            return FeedPage();
          } else if (state.currentPage == Pages.LIBRARY) {
            return LibraryPage();
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
