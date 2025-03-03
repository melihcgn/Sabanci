import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_file/routes/createPost.dart';
import 'package:project_file/routes/feed.dart';
import 'package:project_file/routes/messages.dart';
import 'package:project_file/routes/notifications.dart';
import 'package:project_file/model/bottomNavModel.dart';
import 'package:project_file/routes/profilePage.dart';
import 'package:project_file/util/colors.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  static const String routeName = '/bottomNav';
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static List<Widget> _bottomNavView = [
    Feed(),
    Messages(),
    CreatePost(),
    Notifications(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _bottomNavView.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.primaryLighter,
                    AppColors.primaryLight,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ),
            ),
            child: BottomNavigationBar(

                elevation: 0,
                backgroundColor:  Colors.black.withOpacity(0),
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.black.withOpacity(0),
                unselectedItemColor: Colors.black.withOpacity(0),
                type: BottomNavigationBarType.fixed,
                items: _navBarItem.map(
                        (f) => BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        f.icon,
                        width: 24.0,
                      ),
                      activeIcon: SvgPicture.asset(
                        f.activeIcon,
                        width: 24.0,
                      ),
                      label: f.title,
                    )
                ).toList()
            ),
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}

List<NavBarModel> _navBarItem = [
  NavBarModel(
    icon: 'assets/icons/home.svg',
    activeIcon: 'assets/icons/homeSelected.svg',
    title: "feed",
    width: 35,
  ),
  NavBarModel(
    icon: 'assets/icons/message.svg',
    activeIcon: 'assets/icons/messageSelected.svg',
    title: "messages",
    width: 35,
  ),
  NavBarModel(
    icon: 'assets/icons/add.svg',
    activeIcon: 'assets/icons/addSelected.svg',
    title: "create post",
    width: 35,
  ),
  NavBarModel(
    icon: 'assets/icons/bell.svg',
    activeIcon: 'assets/icons/bellSelected.svg',
    title: "notifications",
    width: 35,
  ),
  NavBarModel(
    icon: 'assets/icons/person.svg',
    activeIcon: 'assets/icons/personSelected.svg',
    title: "profile",
    width: 35,
  ),
];