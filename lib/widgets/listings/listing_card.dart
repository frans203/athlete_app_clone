import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/helper_functions/get_initials.dart';
import 'package:pod1um_flutter_clone/pages/single_listing_page.dart';
import 'package:star_rating/star_rating.dart';

class ListingCard extends StatefulWidget {
  dynamic currentItem;
  ListingCard({required this.currentItem});
  bool isErrorImage = false;

  @override
  State<ListingCard> createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> objectivesArray = widget.currentItem['objectives'];

    return Container(
      width: 339,
      height: 361,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SingleListingPage(key: UniqueKey()),
              settings: RouteSettings(
                arguments: {"listing": widget.currentItem},
              ),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 191,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.currentItem["coverImage"]),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            objectivesArray[objectivesArray!.length - 1]
                                ['title'],
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFFC6C5D0)),
                          ),
                          Text(
                            widget.currentItem['title'],
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFC6C5D0)),
                          ),
                          StarRating(
                            color: Color(0xFFC6C5D0),
                            rating: 3.5,
                            length: 5,
                            starSize: 16,
                            between: 6,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffB9C3FF),
                            onBackgroundImageError: (object, stackTrace) {
                              setState(() {
                                widget.isErrorImage = true;
                              });
                            },
                            backgroundImage: NetworkImage(
                              "${widget.currentItem['user']['avatarUrl']}",
                            ),
                            child: widget.isErrorImage
                                ? Text(
                                    getInitials(
                                        widget.currentItem['user']['name']),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                : null,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "${widget.currentItem['user']['name']}",
                            style: TextStyle(
                                color: Color(0xffC8C6CA),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
