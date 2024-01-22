import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_app_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar();

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with AutoRouteAware {
  late final StreamSubscription<List<Page>> subscription;
  AutoRouteObserver? _observer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // RouterScope exposes the list of provided observers
    // including inherited observers
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      // we subscribe to the observer by passing our
      // AutoRouteAware state and the scoped routeData
      _observer!.subscribe(this, context.routeData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10.0,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomAppBarItem(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_filled,
            labelText: "Home",
            page: Home(),
            pageToChange: Pages.HOME,
          ),
          BottomAppBarItem(
            icon: Icons.explore_outlined,
            selectedIcon: Icons.explore,
            labelText: "Explore",
            page: Explore(),
            pageToChange: Pages.EXPLORE,
          ),
          BottomAppBarItem(
            icon: Icons.rss_feed,
            selectedIcon: Icons.rss_feed_outlined,
            labelText: "Feed",
            page: Feed(),
            pageToChange: Pages.FEED,
          ),
          BottomAppBarItem(
            icon: Icons.folder_open_outlined,
            selectedIcon: Icons.folder,
            labelText: "Library",
            page: Library(),
            pageToChange: Pages.LIBRARY,
          )
        ],
      ),
      color: Color(0xFF131316),
    );
  }

  @override
  void didPush() {
    print('test123');
  }
}
