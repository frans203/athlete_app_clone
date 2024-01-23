import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';

@RoutePage(name: "Home")
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutoRouteAwareStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Stack(
          children: [
            Center(
              child: Text("Home", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  @override
  void didPush() {
    context.read<PagesCubit>().changePage(Pages.HOME);
  }

  @override
  void didPopNext() {
    context.read<PagesCubit>().changePage(Pages.HOME);
  }
}
