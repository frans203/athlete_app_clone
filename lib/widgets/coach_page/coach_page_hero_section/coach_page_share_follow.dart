import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CoachPageShareFollow extends StatelessWidget {
  CoachPageShareFollow({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> shareFunction() async {
      try {
        await Share.share("Text");
      } catch (error) {
        print(error);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            backgroundColor: Color(0xff2B4EDE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Follow",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xffDFE1F9),
            ),
          ),
        ),
        SizedBox(width: 16.0),
        InkWell(
          onTap: () async {
            await shareFunction();
          },
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
