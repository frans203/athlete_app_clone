import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_modal/listing_join_modal/listing_join_modal.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_coach_section/listing_page_coach_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_cover_image/listing_page_cover_image.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_details_section/listing_page_details_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_header_section/listing_page_header_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_section_web.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_similar_listings_section/listing_page_similar_listing_section_web.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_reviews_section/listing_reviews_section_web.dart';

class ListingPageWebWidgets extends StatefulWidget {
  const ListingPageWebWidgets({super.key});

  @override
  State<ListingPageWebWidgets> createState() => _ListingPageWebWidgetsState();
}

class _ListingPageWebWidgetsState extends State<ListingPageWebWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(26.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListingPageHeroSectionWeb(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      children: [
                        ListingPageCoverImage(),
                        ListingPageHeaderSection(),
                        ListingPageDetailsSection(),
                        ListingPageCoachSection(),
                        ListingReviewsSectionWeb(),
                      ],
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Container(child: ListingJoinModal()),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(width: 2, color: Color(0xff2A2A2D)),
              )),
              child: Column(
                children: [
                  ListingPageSimilarListingSectionWeb(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
