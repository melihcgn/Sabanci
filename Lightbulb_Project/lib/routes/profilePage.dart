import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_file/routes/edit_profile.dart';
import 'package:project_file/ui/Post.dart';
import 'package:project_file/util/colors.dart';
import 'package:project_file/util/styles.dart';
import 'package:project_file/util/screenSizes.dart';
import 'package:project_file/util/buttonStyling.dart';
import 'package:project_file/routes/settings.dart';
import 'package:project_file/util/createMaterialColor.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Post> posts = [
    Post(
        title: 'Hello World 1',
        hashtag: 'sfsdg',
        image:
        'https://static.birgun.net/resim/haber-detay-resim/2021/02/25/erzurum-oyununun-yapimcisi-oyun-begenilmeyince-hakaretler-yagdirdi-845533-5.jpg'),
    Post(
        title: 'Hello World 2',
        hashtag: 'sfsdg',
        image:
        'https://pixnio.com/free-images/2019/07/24/2019-07-24-05-25-19-550x309.jpg'),
    Post(
        title: 'Hello World 3',
        hashtag: 'sfsdg',
        image:
        'https://pixnio.com/free-images/2018/12/11/2018-12-11-12-39-11-550x365.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(AppColors.secondaryDark)
      ),
      home: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryDark,
          title: Text(
            'Profile',
            style: navBarHeadingStyle,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SettingsPage()));
              },
            ),
          ],
        ),
        body: Stack(

          children: [
            SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, screenHeight(context)/2.25, 0, 0),
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: posts
                                    .map((post) => mainPost(
                                  post: post,
                                ))
                                    .toList(),
                              ),
                              Column(
                                children: posts
                                    .map((post) => mainPost(
                                  post: post,
                                ))
                                    .toList(),
                              ),
                            ],
                          ), // instagram.com/fawaz.mirza.10
                        ],
                      ),
                    ),
                  )
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.primary,
                              AppColors.primary,
                              AppColors.primary,
                              AppColors.primaryLight,
                              AppColors.primaryLight,
                              AppColors.primaryLight,
                              AppColors.primaryLighter,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: screenHeight(context)/20,
                                      backgroundColor: AppColors.secondaryDark,
                                      child: ClipOval(
                                        child: Image.network(
                                            'https://www.tenforums.com/geek/gars/images/2/types/thumb_15951118880user.png',
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    )
                                  ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                    child: Text(
                                      'Fawaz Mirza',
                                      style: pfpNameStyle,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      '@sillygoose',
                                      style: pfpUserNameStyle,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: screenHeight(context)/42.2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: screenWidth(context)/4.9,
                                    decoration: FollowerFollowingStyle.lsButton,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '345',
                                            style: pfpStatsStyle,
                                          ),
                                          Text(
                                            'Posts',
                                            style: pfpStatsCaptionStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth(context)/4.9,
                                    decoration: FollowerFollowingStyle.lsButton,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '11B',
                                            style: pfpStatsStyle,
                                          ),
                                          Text(
                                            'Followers',
                                            style: pfpStatsCaptionStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth(context)/4.9,
                                    decoration: FollowerFollowingStyle.lsButton,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '650',
                                            style: pfpStatsStyle,
                                          ),
                                          Text(
                                            'Following',
                                            style: pfpStatsCaptionStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  /*const SizedBox(
                            width: 8,
                          ),*/
                                ],
                              ), //345, Posts
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                                    child: Text(
                                      'Hopefully CS310 grade boundaries are nice and low.',
                                      style: pfpStatsCaptionStyle,
                                    ),
                                  ),
                                ],
                              ), // 'Hopefully CS310 grade boundaries are nice and low.'
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center, children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    'instagram.com/fawaz.mirza.10',
                                    style: pfpStatsCaptionStyle,
                                  ),
                                )
                              ]),
                              SizedBox(
                                height: screenHeight(context)/42.2,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (BuildContext context) => EditProfilePage()));
                                        },
                                        child: const Text(
                                          'Edit Profile',
                                          style: lsButtonTextStyle,
                                        ),
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                              color: Color(0x00000000),
                                            )
                                        )
                                    ),
                                    decoration: ButtonStyling.lsButton,
                                    height: screenHeight(context)/21.1,

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
