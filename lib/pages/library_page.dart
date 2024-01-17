import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/helper_functions/user/remove_user.dart';

class LibraryPage extends StatelessWidget {
  LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
