import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_app_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar();

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      elevation: 10.0,
      height: 100,
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
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state)  {
              if(state.user != null){
                return BottomAppBarItem(
                  icon: Icons.folder_open_outlined,
                  selectedIcon: Icons.folder,
                  labelText: "Library",
                  page: Library(),
                  pageToChange: Pages.LIBRARY,
                );
              }
              if(state.user == null) {
                return BottomAppBarItem(
                  icon: Icons.login,
                  selectedIcon: Icons.login,
                  labelText: "Login",
                  page: Library(),
                  pageToChange: Pages.LIBRARY,
                );
              }
              return Container();
            }
          )
        ],
      ),
      color: Color(0xFF131316),
    );
  }
}
