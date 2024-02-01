import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/constants/breakpoints.dart';
import 'package:pod1um_flutter_clone/cubits/login/login_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/pages/pages_cubit.dart';
import 'package:pod1um_flutter_clone/cubits/single_listing/single_listing_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_responsive/listing_page_mobile_widgets.dart';
import 'package:pod1um_flutter_clone/widgets/listing_page/listing_page_responsive/listing_page_web_widgets.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

@RoutePage(name: "SingleListing")
class SingleListingPage extends StatefulWidget {
  final int id;
  SingleListingPage({@PathParam('id') required this.id});

  @override
  State<SingleListingPage> createState() => _SingleListingPageState();
}

class _SingleListingPageState extends State<SingleListingPage>
    with AutoRouteAwareStateMixin<SingleListingPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dynamic user = context.read<LoginCubit>().state.user;
    if (user == null) {
      context
          .read<SingleListingCubit>()
          .setCurrentListingPageData(id: widget.id);
    } else if (user != null) {
      String token = user['token'];
      context
          .read<SingleListingCubit>()
          .setCurrentListingPageData(id: widget.id, token: token);
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<PagesCubit>().changePage(Pages.EXPLORE);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
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
                child: ResponsiveBreakpoints.of(context).largerOrEqualTo(MEDIUM)
                    ? ListingPageWebWidgets()
                    : ListingPageMobileWidgets(),
              );
            } else {
              return Container();
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  @override
  void didPopNext() {
    context.read<PagesCubit>().changePage(Pages.EXPLORE);
  }

  @override
  void didPush() {
    context.read<PagesCubit>().changePage(Pages.EXPLORE);
  }
}
