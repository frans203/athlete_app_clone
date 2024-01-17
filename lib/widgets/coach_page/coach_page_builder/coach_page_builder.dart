import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_details_section/coach_page_details_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/coach_page_hero_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/scrollable_tab_bar.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_listings_section/coach_page_listings_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_testimonials_section/coach_page_testimonials_section.dart';

class CoachPageBuilder extends StatelessWidget {
  int coachId;
  TabController tabController;
  Map<String, GlobalKey<State<StatefulWidget>>?> tabKeysMap;
  CoachPageBuilder(
      {required this.coachId,
      required this.tabKeysMap,
      required this.tabController});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context
          .read<SingleCoachCubit>()
          .setCurrentCoachPageData(coachId: coachId),
      builder: (context, snapshot) {
        return BlocBuilder<SingleCoachCubit, SingleCoachState>(
          builder: (context, state) {
            if (state.singleCoachPageStatus == SingleCoachPageStatus.LOADING) {
              return Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state.singleCoachPageStatus ==
                SingleCoachPageStatus.LOADED) {
              return Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CoachPageHeroSection(),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xff353438), width: 2.0))),
                            child: ScrollableTabBar(
                              tabkeyItems: tabKeysMap,
                              tabController: tabController,
                              isScrollable: true,
                              tabBarIndicatorSize: TabBarIndicatorSize.tab,
                            ),
                          ),
                          CoachPageDetailsSection(
                            key: tabKeysMap["About"],
                          ),
                          CoachPageTestimonialsSection(
                            key: tabKeysMap["Testimonials"],
                          ),
                          CoachPageListingsSection(
                            key: tabKeysMap["Training Plans"],
                          )
                        ],
                      ),
                    ],
                  ));
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
