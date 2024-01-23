import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_modal/listing_join_modal/listing_join_modal.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_coach_section/listing_page_coach_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_details_section/listing_page_details_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_header_section/listing_page_header_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_hero_section/listing_page_hero_section.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_reviews_section/listing_reviews_section.dart';

@RoutePage(name: "SingleListing")
class SingleListingPage extends StatefulWidget {
  final int id;
  SingleListingPage({@PathParam('id') required this.id});

  @override
  State<SingleListingPage> createState() => _SingleListingPageState();
}

class _SingleListingPageState extends State<SingleListingPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<SingleListingCubit>().setCurrentListingPageData(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    context.read<PagesCubit>().changePage(Pages.EXPLORE);
    return Scaffold(
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
    );
  }
}
