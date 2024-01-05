import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_app_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

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
            pageToChange: Pages.HOME,
          ),
          BottomAppBarItem(
            icon: Icons.explore_outlined,
            selectedIcon: Icons.explore,
            labelText: "Explore",
            pageToChange: Pages.EXPLORE,
          ),
          BottomAppBarItem(
            icon: Icons.rss_feed,
            selectedIcon: Icons.rss_feed_outlined,
            labelText: "Feed",
            pageToChange: Pages.FEED,
          ),
          BottomAppBarItem(
            icon: Icons.folder_open_outlined,
            selectedIcon: Icons.folder,
            labelText: "Library",
            pageToChange: Pages.LIBRARY,
          )
        ],
      ),
      color: Color(0xFF131316),
    );
  }
}
