import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_details_section/coach_page_details_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_hero_section/coach_page_hero_section.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_testimonials_section/coach_page_testimonials_section.dart';
import 'package:pod1um_flutter_clone/widgets/global/bottomAppBar/bottom_navigation_bar.dart';
import 'package:pod1um_flutter_clone/widgets/global/searchBar/search_bar.dart';

class SingleCoachPage extends StatefulWidget {
  const SingleCoachPage({super.key});

  @override
  State<SingleCoachPage> createState() => _SingleCoachPageState();
}

class _SingleCoachPageState extends State<SingleCoachPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    final dynamic coachId = arguments['coachId'];
    context.read<SingleCoachCubit>().setCurrentCoachPageData(coachId: coachId);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
              child: BlocBuilder<SingleCoachCubit, SingleCoachState>(
                builder: (context, state) {
                  if (state.singleCoachPageStatus ==
                      SingleCoachPageStatus.LOADING) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state.singleCoachPageStatus ==
                      SingleCoachPageStatus.LOADED) {
                    return Container(
                        margin: EdgeInsets.only(top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CoachPageHeroSection(),
                            CoachPageDetailsSection(),
                            CoachPageTestimonialsSection(),
                          ],
                        ));
                  } else {
                    return Container();
                  }
                },
              )),
        ),
      ),
    );
  }
}
