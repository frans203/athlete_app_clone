import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/pages/training_plans_view.dart';
import 'package:pod1um_flutter_clone/widgets/global/custom_tab_bar/custom_tab_bar.dart';

@RoutePage(name: "explore")
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin, AutoRouteAwareStateMixin<ExplorePage> {
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CustomTabBar(
              tabItems: ['Training Plans', 'Coaches', 'Workouts'],
              tabController: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TrainingPlansView(),
                  Text(
                    "Coaches",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Workouts",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
