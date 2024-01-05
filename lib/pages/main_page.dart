import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/listings/listings_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/pages/explore_page.dart';
import 'package:pod1um_flutter_clone/pages/feed_page.dart';
import 'package:pod1um_flutter_clone/pages/home_page.dart';
import 'package:pod1um_flutter_clone/pages/library_page.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<ListingsCubit>().fetchListings();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
            child: SafeArea(
              child: SearchTopBar(),
            ),
            preferredSize: Size.fromHeight(55)),
        bottomNavigationBar: BottomNavBar(),
        body: BlocBuilder<PagesCubit, PageState>(builder: (context, state) {
          print("state: ${state}");
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
