import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/pages/training_plans_view.dart';
import 'package:pod1um_flutter_clone/widgets/global/custom_tab_bar/custom_tab_bar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Container(
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
    );
  }
}
