
import 'dart:io' show Platform;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_file/routes/createPost.dart';
import 'package:project_file/routes/edit_profile.dart';
import 'package:project_file/routes/searchAndExplore.dart';
import 'package:project_file/util/colors.dart';
import 'package:project_file/util/dimensions.dart';
import 'package:project_file/util/screenSizes.dart';
import 'package:project_file/util/styles.dart';
import 'package:project_file/util/buttonStyling.dart';

import '../model/classes.dart';
import '../ui/post_card.dart';
//import '..lib//Post.dart';

class Feed extends StatefulWidget {
  const  Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();

  static const String routeName = '/feed';
}
class _FeedState extends State<Feed>{
  List<User> tempusers = [
    User( TempUsername: 'Fawaz Mirza', pass: 'password', Email: 'random@email.com', Location: 'IST, Turkey', post1: Post1(caption: 'caption', topics: ["#topics","#topics","#topics"], image: 'https://i.pinimg.com/736x/63/04/af/6304afcd59fd8b795a6482bcb1181404.jpg', likes: 0, comments:  0)),
    User( TempUsername: 'Safwan Yasin', pass: 'password', Email: 'random@email.com', Location: 'IST, Turkey', post1: Post1(caption: 'caption', topics: ["#topics","#topics","#topics"], image: 'https://i.pinimg.com/736x/f6/85/f1/f685f10a3692c5bb362b0f335a37c572.jpg', likes: 0, comments:  0)),
    User( TempUsername: 'Nofil Iqbal', pass: 'password', Email: 'random@email.com', Location: 'IST, Turkey', post1: Post1(caption: 'caption', topics: ["#topics","#topics","#topics"], image: 'https://i.pinimg.com/originals/e5/66/45/e56645a9967cd34ca88fcc7d7220b60c.jpg', likes: 0, comments:  0)),
    User( TempUsername: 'Melih', pass: 'password', Email: 'random@email.com', Location: 'IST, Turkey', post1: Post1(caption: 'caption', topics: ["#topics","#topics","#topics"], image: 'https://i.pinimg.com/564x/ea/35/27/ea3527f8f8b4b40a023ce27d9c19c40e.jpg', likes: 0, comments:  0)),
    User( TempUsername: 'user420', pass: 'password', Email: 'random@email.com', Location: 'IST, Turkey', post1: Post1(caption: 'caption', topics: ["#topics","#topics","#topics"], image: 'https://img.universitystudent.org/1/4/3410/me-finishing-the-semester-meme.jpg', likes: 0, comments:  0)),
    User( TempUsername: 'user69', pass: 'password', Email: 'random@email.com', Location: 'IST, Turkey', post1: Post1(caption: 'caption', topics: ["#topics","#topics","#topics"], image: 'https://titterfun.com/api/assets/image/21wkagpmtm20.jpg', likes: 0, comments:  0)),
  ];

  // List<User> users = [
  // User.post(username: 'Fawaz', email: 'fawaz.WantsAnA@please.com', password: 'pass', followers: 300, following: 0, posts: TempUser( TempUsername: 'Hello world 1', TempCaption: 'March 31', likes: 0, comments: 0, topics: Topic(name: '#CS310'), image: 'https://i.pinimg.com/736x/63/04/af/6304afcd59fd8b795a6482bcb1181404.jpg') ),
  // ];
  // int postcount = 0;
  void deletePost(User tempuser){
    setState(() {
      tempusers.remove(tempuser);
    });
  }

  void incrementlikes(tempuser){
    setState(() {
      tempuser.likes++;
      //post.likes.color = AppColors.secondaryLight;
    });
  }

  void buttonClicked(){
    setState(() {
      //  postcount++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text(
          'Feed',
          style: navBarHeadingStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondaryDark,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primary,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SearchAndExplore()));
            },
          ),
        ],
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: AppColors.primary,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        // actions: [
        // IconButton(
        //   icon: Icon(
        //     Icons.settings,
        //     color: AppColors.primary,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //         builder: (BuildContext context) => EditProfilePage()));
        //   },
        // ),
        //   IconButton(
        //     icon: Icon(
        //       Icons.add,
        //       color: AppColors.primary,
        //     ),
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (BuildContext context) => createPost()));
        //     },
        //   ),
        // ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: SafeArea(
            // child: Padding(
            //  padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: tempusers.map((tempuser) => PostCard(
                    tempuser: tempuser,
                    delete: (){
                      deletePost(tempuser);
                    },
                    inclikes: (){
                      incrementlikes(tempuser);
                    },
                  )).toList(),//posts.map((post) => Postcard(
                  //  post: post,
                  //  delete: (){
                  //    deletePost(post);
                  //  },
                  // inclikes: (){
                  //   incrementlikes(post);
                  // },
                  //)).toList(),

                ),
              ],
              //),
            ),
          ),
        ),
      ),
    );
  }
}//
