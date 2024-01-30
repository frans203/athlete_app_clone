import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pod1um_flutter_clone/helper_functions/get_initials.dart';
import 'package:pod1um_flutter_clone/routing/app_router.dart';
import 'package:star_rating/star_rating.dart';

class ListingCard extends StatefulWidget {
  dynamic currentItem;
  ListingCard({required this.currentItem});
  bool isErrorImage = false;

  @override
  State<ListingCard> createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  String? errorImage = null;
  @override
  Widget build(BuildContext context) {
    List<dynamic> objectivesArray = widget.currentItem['objectives'];
    var router = AutoRouter.of(context);

    return Card(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          router.push(
            SingleListing(id: widget.currentItem['id']),
          );
        },
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: errorImage != null
                          ? AssetImage(errorImage!) as ImageProvider<Object>
                          : NetworkImage(widget.currentItem["coverImage"]),
                      onError: (error, trace) {
                        setState(() {
                          errorImage = "assets/images/pre-season-cycle.png";
                        });
                      }),
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
