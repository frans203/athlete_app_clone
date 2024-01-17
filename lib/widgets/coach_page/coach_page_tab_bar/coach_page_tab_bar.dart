import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/scrollable_tab_bar.dart';

class CoachPageTabBar extends StatelessWidget {
  Map<String, GlobalKey<State<StatefulWidget>>?> tabKeysMap;
  TabController tabController;
  CoachPageTabBar({required this.tabKeysMap, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleCoachCubit, SingleCoachState>(
      builder: (context, state) => Visibility(
        visible: state.showScrollableTabBar,
        child: Positioned(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xff1F1F23),
                border: Border(
                    bottom: BorderSide(color: Color(0xff353438), width: 2.0))),
            child: ScrollableTabBar(
              tabkeyItems: tabKeysMap,
              tabController: tabController,
              isScrollable: true,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ),
      ),
    );
  }
}
