import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/widgets/global/custom_tab_bar/custom_tab_bar.dart';

class ScrollableTabBar extends StatefulWidget {
  Map<String, GlobalKey<State<StatefulWidget>>?> tabkeyItems;
  TabController tabController;
  bool? isScrollable;
  TabBarIndicatorSize? tabBarIndicatorSize;

  ScrollableTabBar({
    required this.tabkeyItems,
    required this.tabController,
    this.isScrollable,
    this.tabBarIndicatorSize,
  });

  @override
  State<ScrollableTabBar> createState() => _ScrollableTabBarState();
}

class _ScrollableTabBarState extends State<ScrollableTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    widget.tabController.addListener(() {
      int selectedIndex = widget.tabController.index;
      switch (selectedIndex) {
        case 0:
          Scrollable.ensureVisible(
            alignment: 0.1,
            duration: Duration(milliseconds: 400),
            widget.tabkeyItems["About"]!.currentContext!,
          );
          break;
        case 1:
          Scrollable.ensureVisible(
            alignment: 0.1,
            duration: Duration(milliseconds: 400),
            widget.tabkeyItems["Testimonials"]!.currentContext!,
          );
          break;
        case 2:
          Scrollable.ensureVisible(
              alignment: -0.1,
              duration: Duration(milliseconds: 400),
              widget.tabkeyItems["Training Plans"]!.currentContext!);
          break;
        case 3:
          break;
      }
    });
    return TabBar(
      padding: EdgeInsets.only(bottom: 4.0),
      controller: widget.tabController,
      indicatorSize: widget.tabBarIndicatorSize ?? TabBarIndicatorSize.label,
      labelColor: Color(0xffB9C3FF),
      dividerColor: Color(0xff353438),
      dividerHeight: 1.0,
      labelStyle: TextStyle(fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      unselectedLabelColor: Color(0xffC6C5D0),
      indicator: CustomIndicator(),
      isScrollable: widget.isScrollable ?? false,
      tabs: widget.tabkeyItems.entries
          .map((entry) => Tab(
                text: entry.key,
              ))
          .toList(),
    );
  }
}
