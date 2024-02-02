import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';

class DashboardAnimationControl extends StatefulWidget {
  final Widget child;
  final Function? additionalScrollFunction;
  DashboardAnimationControl(
      {required this.child, this.additionalScrollFunction});

  @override
  State<DashboardAnimationControl> createState() =>
      _DashboardAnimationControlState();
}

class _DashboardAnimationControlState extends State<DashboardAnimationControl> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    context.read<PagesCubit>().setEnteredPage(true);
    scrollController.addListener(() {
      var currentScrollPosition = scrollController.position.userScrollDirection;
      if (currentScrollPosition.name == 'forward') {
        context.read<PagesCubit>().showSearchBar(true);
      }
      if (currentScrollPosition.name == 'reverse') {
        context.read<PagesCubit>().showSearchBar(false);
      }
      context.read<PagesCubit>().setEnteredPage(false);
      if (widget.additionalScrollFunction != null) {
        widget.additionalScrollFunction!(scrollController);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: scrollController, child: widget.child);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
