import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/helper_functions/get_initials.dart';

class CoachTestimonial extends StatefulWidget {
  dynamic testimonial;
  CoachTestimonial({required this.testimonial});
  bool isErrorImage = false;

  @override
  State<CoachTestimonial> createState() => _CoachTestimonialState();
}

class _CoachTestimonialState extends State<CoachTestimonial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffB9C3FF),
                onBackgroundImageError: (object, stackTrace) {
                  setState(() {
                    widget.isErrorImage = true;
                  });
                },
                backgroundImage: NetworkImage(
                  widget.testimonial['url'],
                ),
                child: widget.isErrorImage
                    ? Text(
                        getInitials(widget.testimonial['name']),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    : null,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.testimonial['name']}",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "${widget.testimonial['organisation']}",
                    style: TextStyle(
                      color: Color(0xffE0E0E0),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            child: Text(
              "${widget.testimonial['description']}",
              style: TextStyle(
                color: Color(0xffC6C5D0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
