import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_builder/coach_page_builder.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_tab_bar/coach_page_tab_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';

class SingleCoachPage extends StatefulWidget {
  const SingleCoachPage({super.key});
  @override
  State<SingleCoachPage> createState() => _SingleCoachPageState();
}

class _SingleCoachPageState extends State<SingleCoachPage>
    with TickerProviderStateMixin {
  var aboutSection = GlobalKey();
  var testimonialsSection = GlobalKey();
  var listingsSection = GlobalKey();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    final dynamic coachId = arguments['coachId'];
    Map<String, GlobalKey<State<StatefulWidget>>?> tabKeysMap = {
      "About": aboutSection,
      "Testimonials": testimonialsSection,
      "Training Plans": listingsSection,
      "1 to 1 Coaching": null,
    };

    TabController _tabController = TabController(length: 4, vsync: this);
    scrollController.addListener(() {
      if (scrollController.offset >= 200) {
        context.read<SingleCoachCubit>().showScrollableTabBar(true);
      } else if (scrollController.offset < 200) {
        context.read<SingleCoachCubit>().showScrollableTabBar(false);
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: SearchTopBar(),
        ),
        preferredSize: Size.fromHeight(55),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              width: double.maxFinite,
              child: CoachPageBuilder(
                tabController: _tabController,
                coachId: coachId,
                tabKeysMap: tabKeysMap,
              ),
            ),
          ),
          CoachPageTabBar(tabKeysMap: tabKeysMap, tabController: _tabController)
        ],
      ),
    );
  }
}
