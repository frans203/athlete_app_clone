import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_builder/coach_page_builder.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_tab_bar/coach_page_tab_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/dashboard_animation_control/DashboardAnimationControl.dart';

@RoutePage(name: "Coach")
class SingleCoachPage extends StatefulWidget {
  int coachId;
  SingleCoachPage({@PathParam('id') required this.coachId});
  @override
  State<SingleCoachPage> createState() => _SingleCoachPageState();
}

class _SingleCoachPageState extends State<SingleCoachPage>
    with TickerProviderStateMixin, AutoRouteAwareStateMixin<SingleCoachPage> {
  var aboutSection = GlobalKey();
  var testimonialsSection = GlobalKey();
  var listingsSection = GlobalKey();

  void listenScrollChangeTabBar(ScrollController scrollController) {
    if (scrollController.offset >= 200) {
      context.read<SingleCoachCubit>().showScrollableTabBar(true);
    } else if (scrollController.offset < 200) {
      context.read<SingleCoachCubit>().showScrollableTabBar(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dynamic coachId = widget.coachId;
    Map<String, GlobalKey<State<StatefulWidget>>?> tabKeysMap = {
      "About": aboutSection,
      "Testimonials": testimonialsSection,
      "Training Plans": listingsSection,
      "1 to 1 Coaching": null,
    };

    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        body: Stack(
      children: [
        DashboardAnimationControl(
          additionalScrollFunction: listenScrollChangeTabBar,
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
    ));
  }

  @override
  void didPush() {
    context.read<PagesCubit>().changePage(Pages.EXPLORE);
  }

  @override
  void didPopNext() {
    context.read<PagesCubit>().changePage(Pages.EXPLORE);
  }
}
