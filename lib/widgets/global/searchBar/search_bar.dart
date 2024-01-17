import 'package:flutter/material.dart';

class SearchTopBar extends StatefulWidget {
  SearchTopBar({super.key});

  @override
  State<SearchTopBar> createState() => _SearchTopBarState();
}

class _SearchTopBarState extends State<SearchTopBar> {
  final List<String> searchOption = ["Workouts", "Training Plans", "Coaches"];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Color(0xffC6C5D0),
            ),
            SizedBox(
              width: 10,
            ),
            Form(
              key: _formKey,
              child: Expanded(
                child: TextFormField(
                  onChanged: (String? value) {
                    setState(() {
                      userInput = value;
                    });
                  },
                  style: TextStyle(
                    color: Color(0xffC6C5D0),
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Search Content & Services",
                    hintStyle: TextStyle(
                      color: Color(0xffC6C5D0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xffC6C5D0),
                            style: BorderStyle.solid,
                            width: 1.0)),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
