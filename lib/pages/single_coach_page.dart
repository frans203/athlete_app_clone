import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_details_section/coach_page_details_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/coach_page_hero_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/scrollable_tab_bar.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_listings_section/coach_page_listings_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_testimonials_section/coach_page_testimonials_section.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';

class SingleCoachPage extends StatefulWidget {
  SingleCoachPage({super.key});
  bool showTopBar = false;
  @override
  State<SingleCoachPage> createState() => _SingleCoachPageState();
}

class _SingleCoachPageState extends State<SingleCoachPage>
    with TickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    final dynamic coachId = arguments['coachId'];
    context.read<SingleCoachCubit>().setCurrentCoachPageData(coachId: coachId);
  }

  @override
  Widget build(BuildContext context) {
    var aboutSection = GlobalKey();
    var testimonialsSection = GlobalKey();
    var listingsSection = GlobalKey();
    var inPageTabBar = GlobalKey();

    TabController _tabController = TabController(length: 4, vsync: this);
    Map<String, GlobalKey<State<StatefulWidget>>?> tabKeysMap = {
      "About": aboutSection,
      "Testimonials": testimonialsSection,
      "Training Plans": listingsSection,
      "1 to 1 Coaching": null,
    };
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
          MediaQuery.of(context).size.height * 0.5) {
        context.read<SingleCoachCubit>().showScrollableTabBar(true);
      } else if (_scrollController.offset <
          MediaQuery.of(context).size.height * 0.5) {
        context.read<SingleCoachCubit>().showScrollableTabBar(false);
      }
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: SafeArea(
            child: SearchTopBar(),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                  width: double.maxFinite,
                  child: BlocBuilder<SingleCoachCubit, SingleCoachState>(
                    builder: (context, state) {
                      if (state.singleCoachPageStatus ==
                          SingleCoachPageStatus.LOADING) {
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
                                      key: inPageTabBar,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color(0xff353438),
                                                  width: 2.0))),
                                      child: ScrollableTabBar(
                                        tabkeyItems: tabKeysMap,
                                        tabController: _tabController,
                                        isScrollable: true,
                                        tabBarIndicatorSize:
                                            TabBarIndicatorSize.tab,
                                      ),
                                    ),
                                    CoachPageDetailsSection(
                                      key: aboutSection,
                                    ),
                                    CoachPageTestimonialsSection(
                                        key: testimonialsSection),
                                    CoachPageListingsSection(
                                      key: listingsSection,
                                    )
                                  ],
                                ),
                              ],
                            ));
                      } else {
                        return Container();
                      }
                    },
                  )),
            ),
            BlocBuilder<SingleCoachCubit, SingleCoachState>(
              builder: (context, state) => Visibility(
                visible: state.showScrollableTabBar,
                child: Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff1F1F23),
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xff353438), width: 2.0))),
                    child: ScrollableTabBar(
                      tabkeyItems: tabKeysMap,
                      tabController: _tabController,
                      isScrollable: true,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
