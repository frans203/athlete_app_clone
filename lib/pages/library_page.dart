import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/helper_functions/user/remove_user.dart';

@RoutePage(name: "Library")
class LibraryPage extends StatefulWidget {
  LibraryPage();

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with AutoRouteAwareStateMixin<LibraryPage> {
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

  @override
  void didPush() {
    context.read<PagesCubit>().changePage(Pages.LIBRARY);
  }

  @override
  void didPopNext() {
    context.read<PagesCubit>().changePage(Pages.LIBRARY);
  }
}
