import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/helper_functions/get_initials.dart';
import 'package:star_rating/star_rating.dart';

class ListingReview extends StatefulWidget {
  dynamic data;
  ListingReview({required this.data});

  @override
  State<ListingReview> createState() => _ListingReviewState();
}

class _ListingReviewState extends State<ListingReview> {
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    List<dynamic>? organisations =
        widget.data['user']['organisations']?.length > 0
            ? widget.data['user']['organisations']
            : [];
    int currentScore = widget.data["score"];

    return Container(
      margin: EdgeInsets.only(bottom: 26.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffB9C3FF),
                onBackgroundImageError: (object, stackTrace) {
                  setState(() {
                    hasError = true;
                  });
                },
                backgroundImage:
                    NetworkImage("${widget.data['user']['avatarUrl']}"),
                child: hasError
                    ? Text(
                        getInitials(widget.data['user']['name']),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
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
                    "${widget.data['user']['name']}",
                    style: TextStyle(color: Colors.white),
                  ),
                  organisations!.length > 0
                      ? Text(
                          "${organisations[organisations.length - 1]['name']}",
                          style: TextStyle(
                            color: Color(0xffC8C6CA),
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      StarRating(
                        color: Color(0xFFC6C5D0),
                        rating: currentScore.toDouble(),
                        length: 5,
                        starSize: 16,
                        between: 6,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        "${widget.data['score']}",
                        style: TextStyle(
                          color: Color(0xFFC6C5D0),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            "${widget.data['description']}",
            style: TextStyle(
              color: Color(0xffC6C5D0),
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }
}
