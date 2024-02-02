import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/constants/breakpoints.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/left_nav_bar/left_nav_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import "package:simple_animations/simple_animations.dart";

@RoutePage(name: "DashboardRoute")
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with AutoRouteAwareStateMixin<Dashboard>, TickerProviderStateMixin {
  bool showBottomNavbar = true;
  var control = Control.play;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ResponsiveBreakpoints.of(context).smallerThan(LARGE)) {
      showBottomNavbar = true;
    }
    if (ResponsiveBreakpoints.of(context).largerOrEqualTo(LARGE)) {
      setState(() {
        showBottomNavbar = false;
      });
    }
  }

  Widget build(BuildContext context) {
    if (showBottomNavbar) {
      return Scaffold(
          bottomNavigationBar: BottomNavBar(),
          body: BlocBuilder<PagesCubit, PageState>(builder: (context, state) {
            return Stack(
              children: [
                CustomAnimationBuilder<double>(
                  control: !state.enteredPage
                      ? (state.showSearchBar
                          ? Control.playFromStart
                          : Control.playReverseFromEnd)
                      : Control.stop,
                  tween: Tween<double>(begin: 0, end: 50),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, value, _) => Padding(
                    padding:
                        EdgeInsets.only(top: state.enteredPage ? 50 : value),
                    child: AutoRouter(),
                  ),
                ),
                CustomAnimationBuilder<double>(
                  control: !state.enteredPage
                      ? (state.showSearchBar
                          ? Control.playReverseFromEnd
                          : Control.playFromStart)
                      : Control.stop,
                  tween: Tween<double>(begin: 0, end: 50),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, value, _) => Positioned(
                    top: state.enteredPage ? 0 : value * -1,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: SearchTopBar(),
                    ),
                  ),
                )
              ],
            );
          }));
    }

    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.06, top: 70),
          child: AutoRouter(),
        ),
        Positioned(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.06,
              child: LeftNavBar()),
          top: 0,
          left: 0,
        ),
        Positioned(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.94,
              height: 70,
              child: SearchTopBar()),
          top: 0,
          right: 0,
        )
      ]),
    );
  }
}
