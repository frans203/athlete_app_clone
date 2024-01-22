import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';

class BottomAppBarItem extends StatefulWidget {
  String labelText;
  IconData icon;
  IconData selectedIcon;
  PageRouteInfo<dynamic> page;
  Pages pageToChange;
  BottomAppBarItem({
    required this.labelText,
    required this.icon,
    required this.selectedIcon,
    required this.page,
    required this.pageToChange,
  });

  @override
  State<BottomAppBarItem> createState() => _BottomAppBarItemState();
}

class _BottomAppBarItemState extends State<BottomAppBarItem> {
  @override
  Widget build(BuildContext context) {
    var router = AutoRouter.of(context);
    return BlocBuilder<PagesCubit, PageState>(
      builder: (context, state) => Container(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide.none,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: state.currentPage == widget.pageToChange
                      ? Color(0xff434659)
                      : null,
                ),
                child: Icon(
                  state.currentPage == widget.pageToChange
                      ? widget.selectedIcon
                      : widget.icon,
                  color: Color(0xffDFE1F9),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                widget.labelText,
                style: TextStyle(
                  color: Color(0xffC6C5D0),
                ),
              )
            ],
          ),
          onPressed: () {
            router.push(widget.page);
            context.read<PagesCubit>().changePage(widget.pageToChange);
          },
        ),
      ),
    );
  }
}
