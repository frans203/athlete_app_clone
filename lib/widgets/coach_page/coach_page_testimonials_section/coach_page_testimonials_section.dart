import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod1um_flutter_clone/constants/constants.dart';
import 'package:pod1um_flutter_clone/cubits/single_coach/single_coach_cubit.dart';
import 'package:pod1um_flutter_clone/widgets/coach_page/coach_page_testimonials_section/coach_testimonial.dart';

class CoachPageTestimonialsSection extends StatelessWidget {
  const CoachPageTestimonialsSection({super.key});
  @override
  Widget build(BuildContext context) {
    // List<dynamic> currentTestimonials = [...mockTestimonials];
    List<dynamic> currentTestimonials =
        context.read<SingleCoachCubit>().state.currentCoach['testimonials'];
    return currentTestimonials.length > 0
        ? Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Testimonials",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 34.0,
                ),
                BlocBuilder<SingleCoachCubit, SingleCoachState>(
                    builder: (context, state) {
                  return Column(
                    children: [
                      for (var i = 0;
                          currentTestimonials.length > MAX_REVIEWS &&
                                  !state.showAllTestimonials
                              ? i < MAX_REVIEWS
                              : i < currentTestimonials.length;
                          i++)
                        CoachTestimonial(
                          testimonial: currentTestimonials[i],
                        ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<SingleCoachCubit>()
                              .invertShowAllTestimonials();
                        },
                        child: Text(
                          state.showAllTestimonials
                              ? "See Less Reviews"
                              : "See all ${currentTestimonials.length} reviews",
                          style: TextStyle(color: Color(0xffB9C3FF)),
                        ),
                      )
                    ],
                  );
                }),
              ],
            ),
          )
        : Container();
  }
}
