import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  List<String> tabItems;
  TabController tabController;
  bool? isScrollable;
  TabBarIndicatorSize? tabBarIndicatorSize;
  CustomTabBar({
    required this.tabItems,
    required this.tabController,
    this.isScrollable,
    this.tabBarIndicatorSize,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.only(bottom: 4.0),
      controller: widget.tabController,
      indicatorSize: widget.tabBarIndicatorSize ?? TabBarIndicatorSize.label,
      labelColor: Color(0xffB9C3FF),
      labelStyle: TextStyle(fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      unselectedLabelColor: Color(0xffC6C5D0),
      indicator: CustomIndicator(),
      isScrollable: widget.isScrollable ?? false,
      tabs: widget.tabItems
          .map((item) => InkWell(
                child: Tab(
                  text: item,
                ),
              ))
          .toList(),
    );
  }
}

class CustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter();
  }
}

class _UnderlinePainter extends BoxPainter {
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = Color(0xffB9C3FF);
    _paint.isAntiAlias = true;
    double? width = configuration.size?.width;
    double height = 4;
    RRect rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(offset.dx, configuration.size!.height, width!, height),
      topRight: Radius.circular(5),
      topLeft: Radius.circular(5),
    );
    canvas.drawRRect(rrect, _paint);
  }
}
