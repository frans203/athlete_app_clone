import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_modal/listing_join_modal/listing_join_modal.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_coach_section/listing_page_coach_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_details_section/listing_page_details_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_header_section/listing_page_header_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_reviews_section/listing_reviews_section.dart';

class SingleListingPage extends StatefulWidget {
  SingleListingPage({super.key});

  @override
  State<SingleListingPage> createState() => _SingleListingPageState();
}

class _SingleListingPageState extends State<SingleListingPage> {
  String routeName = '/listing';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    final dynamic listing = arguments["listing"];
    context.read<SingleListingCubit>().setCurrentListingPageData(
        coachId: listing['user']['id'], currentListing: listing);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: SafeArea(
            child: SearchTopBar(),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: BlocConsumer<SingleListingCubit, SingleListingState>(
              builder: (context, state) {
                if (state.status == SingleListingStatus.LOADING) {
                  return Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state.status == SingleListingStatus.LOADED) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xff131316),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListingPageHeroSection(),
                        ListingPageHeaderSection(),
                        ListingPageDetailsSection(),
                        ListingJoinModal(),
                        ListingPageCoachSection(),
                        ListingReviewsSection(),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
              listener: (context, state) {},
            ),
          ),
        ),
      ),
    );
  }
}
