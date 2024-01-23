import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';

@RoutePage(name: "DashboardRoute")
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with AutoRouteAwareStateMixin<Dashboard> {
  @override
  void didPushNext() {
    print('testeasdasdadada');
  }

  @override
  void didPush() {
    context.read<PagesCubit>().changePage(Pages.FEED);
  }

  @override
  void didPopNext() {
    print('testeasdasdadada');
  }

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
