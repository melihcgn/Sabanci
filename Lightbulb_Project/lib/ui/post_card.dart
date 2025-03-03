import 'dart:io' show Platform;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:project_file/util/colors.dart';
import 'package:project_file/util/dimensions.dart';
import 'package:project_file/util/screenSizes.dart';
import 'package:project_file/util/styles.dart';
import 'package:project_file/util/buttonStyling.dart';

import '../model/classes.dart';
import '../ui/post_card.dart';
//import '..lib//Post.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import '../routes/settings.dart';



class PostCard extends StatelessWidget {

  //final User user;
  final User tempuser;
  final VoidCallback delete;
  final VoidCallback inclikes;
  PostCard({required this.tempuser, required this.delete, required this.inclikes});
  Color _iconcolor = AppColors.white;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: AppColors.greyDarker,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  //Image.network(tempuser.image),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        tempuser.post1.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: CircleAvatar(
                              backgroundColor: AppColors.secondaryDark,
                              child: ClipOval(
                                child: Image.network(
                                  'https://www.tenforums.com/geek/gars/images/2/types/thumb_15951118880user.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              radius: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children : [
                                // const SizedBox(width: 8),

                                Container(

                                  //color: AppColors.secondaryDark,
                                  constraints: const BoxConstraints(maxWidth: 200),
                                  width: MediaQuery.of(context).size.width,
                                  //child: Align(
                                  // alignment: Alignment.centerRight,
                                  child: Text(
                                    tempuser.TempUsername,
                                    style: usernameStyle,
                                    //textAlign: TextAlign.start,
                                  ),
                                  // ),
                                ),
                                // const SizedBox(width: 8),
                                Container(
                                  //color: AppColors.secondaryDark,
                                  constraints: const BoxConstraints(maxWidth: 200),
                                  width: MediaQuery.of(context).size.width,
                                  //child: Align(
                                  // alignment: Alignment.centerRight,
                                  child: Text(
                                    tempuser.post1.caption,
                                    style: captionStyle,
                                    //textAlign: TextAlign.start,
                                  ),
                                  // ),
                                ),
                                // const SizedBox(width: 8),
                                Container(
                                  //color: AppColors.secondaryDark,
                                    constraints: const BoxConstraints(maxWidth: 200),
                                    width: MediaQuery.of(context).size.width,
                                    //child: Align(
                                    // alignment: Alignment.centerRight,
                                    child: Row(
                                      // Text(
                                      //   tempuser.post1.topics[0],
                                      //   style: topicStyle,
                                      //   //textAlign: TextAlign.start,
                                      // ),
                                        children: tempuser.post1.topics.map((topic) => Text(
                                          topic + ' ',
                                          style: topicStyle,
                                          textAlign: TextAlign.start,
                                        )).toList()
                                    )
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            LikeButton(
                              mainAxisAlignment: MainAxisAlignment.end,
                              size: 20.0,
                              circleColor:
                              CircleColor(start: AppColors.primaryLightest, end: AppColors.primaryLighter),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: AppColors.secondaryDark,
                                dotSecondaryColor: AppColors.secondaryLight,
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.favorite,
                                  color: isLiked ? AppColors.secondaryLight : AppColors.grey,
                                  size: 20.0,
                                );
                              },
                            ),

                            const SizedBox(width: 2),


                            const Icon(
                              Icons.chat_bubble_outline,
                              size: 18.0,
                              color: AppColors.grey,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              tempuser.post1.comments.toString(),
                              style: captionStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
