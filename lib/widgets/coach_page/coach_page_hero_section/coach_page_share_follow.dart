import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/coach_page_follow_btn.dart';
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
        CoachPageFollowBtn(),
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
