import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/helper_functions/user/get_user.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';

@RoutePage(name: "Initial")
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    var router = AutoRouter.of(context);

    getUser().then((user) {
      // if (user != null) {
      //   Navigator.pushNamed(context, "/main");
      // }
      // if (user == null) {
      //   Navigator.pushNamed(context, "/login");
      // }
      if (user != null) {
        router.replace(DashboardRoute());
      }
      if (user == null) {
        router.replace(Login());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
