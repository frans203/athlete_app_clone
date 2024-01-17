import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/helper_functions/user/get_user.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    getUser().then((user) {
      if (user != null) {
        Navigator.pushNamed(context, "/main");
      }
      if (user == null) {
        Navigator.pushNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
