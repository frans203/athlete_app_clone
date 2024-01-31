import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pod1um_flutter_clone/constants/breakpoints.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_modal/listing_join_modal/listing_join_modal_service_btn.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_modal/listing_modal_action.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class ListingJoinModal extends StatelessWidget {
  const ListingJoinModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xff2A2A2D),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(
            "Join Pod1um for Free",
            style: TextStyle(
              fontSize: 22,
              color: Color(0xffC8C6CA),
            ),
          ),
          Container(
            width: ResponsiveBreakpoints.of(context).largerOrEqualTo(MEDIUM)
                ? 400
                : double.maxFinite,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                ListingJoinModalServiceBtn(
                  serviceTitle: "Google",
                  serviceIconData: FontAwesomeIcons.google,
                  size: 18,
                ),
                SizedBox(
                  height: 10,
                ),
                ListingJoinModalServiceBtn(
                  serviceTitle: "Facebook",
                  serviceIconData: Icons.facebook,
                ),
                SizedBox(
                  height: 10,
                ),
                ListingJoinModalServiceBtn(
                  serviceTitle: "Apple",
                  serviceIconData: Icons.apple,
                ),
              ],
            ),
          ),
          Text(
            "Or",
            style: TextStyle(color: Color(0xffC8C6CA)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: ResponsiveBreakpoints.of(context).largerOrEqualTo(MEDIUM)
                ? 400
                : double.maxFinite,
            child: ListingModalAction(
              text: "Create Account",
            ),
          ),
        ],
      ),
    );
  }
}
