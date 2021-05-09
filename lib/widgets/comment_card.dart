import 'package:flutter/material.dart';
import 'package:travel_app/Models/model.dart';

import '../constants.dart';

class CommentCard extends StatefulWidget {
  final Review review;

  const CommentCard({@required this.review});

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  void initState() {
     super.initState();
  }
  double height = 70;
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clicked = !clicked;
        if(clicked) {
         height = height * 2;
        }
        else height = 70;
        setState(() {
        });
      },
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.BackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.kPrimaryColor.withOpacity(0.3),
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 2.0, // has the effect of extending the shadow
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.fromLTRB(14, 2, 2, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                /// avatar
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(widget.review.avatar , height: 40,),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.review.userName,
                            style: TextStyle(
                                color: AppColors.kPrimaryColor, fontSize: 18),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.kRatingStarColor,
                                size: 15,
                              ),
                              Text('${widget.review.rating}',
                                  style:
                                      TextStyle(color: AppColors.BTextColor)),
                            ],
                          ),
                        ],
                      ),
                      Flexible(
                        child: Container(
                          child: Text(
                            widget.review.content,
                            style: TextStyle(color: AppColors.BTextColor),
                            maxLines:  clicked ? 10 : 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Transform.rotate(angle: clicked ?  1.5 : 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
