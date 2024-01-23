import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';

@RoutePage(name: "Feed")
class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with AutoRouteAwareStateMixin<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Feed Page", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  void didPush() {
    context.read<PagesCubit>().changePage(Pages.FEED);
  }

  @override
  void didPopNext() {
    context.read<PagesCubit>().changePage(Pages.FEED);
  }
}
