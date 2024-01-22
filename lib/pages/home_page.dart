import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "Home")
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
}
