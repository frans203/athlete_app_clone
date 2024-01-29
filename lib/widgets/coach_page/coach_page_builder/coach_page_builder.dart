import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_details_section/coach_page_details_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/coach_page_hero_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/scrollable_tab_bar.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_listings_section/coach_page_listings_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_testimonials_section/coach_page_testimonials_section.dart';

class CoachPageBuilder extends StatefulWidget {
  int coachId;
  TabController tabController;
  Map<String, GlobalKey<State<StatefulWidget>>?> tabKeysMap;
  CoachPageBuilder(
      {required this.coachId,
      required this.tabKeysMap,
      required this.tabController});

  @override
  State<CoachPageBuilder> createState() => _CoachPageBuilderState();
}

class _CoachPageBuilderState extends State<CoachPageBuilder> {
  final GlobalKey scrollableTabBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    dynamic user = context.read<LoginCubit>().state.user;
    String? token;
    if (user == null) {
      token = null;
    } else {
      token = user['token'];
    }

    return FutureBuilder(
      future: context
          .read<SingleCoachCubit>()
          .setCurrentCoachPageData(coachId: widget.coachId, token: token),
      builder: (context, snapshot) {
        return BlocConsumer<SingleCoachCubit, SingleCoachState>(
          listener: (context, state) {},
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
                            child: Container(
                              key: scrollableTabBarKey,
                              child: ScrollableTabBar(
                                tabkeyItems: widget.tabKeysMap,
                                tabController: widget.tabController,
                                isScrollable: true,
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                              ),
                            ),
                          ),
                          CoachPageDetailsSection(
                            key: widget.tabKeysMap["About"],
                          ),
                          CoachPageTestimonialsSection(
                            key: widget.tabKeysMap["Testimonials"],
                          ),
                          CoachPageListingsSection(
                            key: widget.tabKeysMap["Training Plans"],
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
