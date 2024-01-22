import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';

@RoutePage(name: "DashboardRoute")
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: PreferredSize(
          child: SafeArea(
            child: SearchTopBar(),
          ),
          preferredSize: Size.fromHeight(55)),
      body: Expanded(
        child: AutoRouter(),
      ),
    );
  }
}
