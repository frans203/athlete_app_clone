import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/helper_functions/user/remove_user.dart';

@RoutePage(name: "Library")
class LibraryPage extends StatelessWidget {
  LibraryPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("Library Page", style: TextStyle(color: Colors.white)),
              ElevatedButton(
                onPressed: () {
                  removeUser(context);
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
