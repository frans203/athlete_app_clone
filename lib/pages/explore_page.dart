import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/pages/training_plans_view.dart';

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
          TabBar(
            padding: EdgeInsets.all(0),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Color(0xffB9C3FF),
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
            unselectedLabelColor: Color(0xffC6C5D0),
            indicator: CustomIndicator(),
            tabs: [
              Tab(
                text: "Training Plans",
              ),
              Tab(
                text: "Coaches",
              ),
              Tab(
                text: "Workouts",
              )
            ],
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

class CustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _HorizontalIndicator();
  }
}

class _HorizontalIndicator extends BoxPainter {
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = Color(0xffB9C3FF);
    _paint.isAntiAlias = true;
    double? width = configuration.size?.width;
    double height = 4;
    RRect rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
          offset.dx, configuration.size!.height - offset.dy, width!, height),
      topRight: Radius.circular(5),
      topLeft: Radius.circular(5),
    );
    canvas.drawRRect(rrect, _paint);
  }
}
