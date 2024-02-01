import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_modal/listing_join_modal/listing_join_modal.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_coach_section/listing_page_coach_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_details_section/listing_page_details_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_header_section/listing_page_header_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_similar_listings_section/listing_page_similar_listings_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_reviews_section/listing_reviews_section.dart';

class ListingPageMobileWidgets extends StatelessWidget {
  const ListingPageMobileWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListingPageHeroSection(),
        ListingPageHeaderSection(),
        ListingPageDetailsSection(),
        ListingJoinModal(),
        ListingPageCoachSection(),
        ListingReviewsSection(),
        ListingPageSimilarListingsSection()
      ],
    );
  }
}
