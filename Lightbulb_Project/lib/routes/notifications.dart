import 'package:flutter/material.dart';
import 'package:project_file/ui/notificationCard.dart';

import '../model/classes.dart';
import '../util/colors.dart';
import '../util/styles.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  List<tempNotification> tempNoti = [
    tempNotification(name: 'Apple', time: DateTime.parse('2022-05-22 20:18:04'), Info: 'Sent you a follow request'),
    tempNotification(name: 'Nofil', time: DateTime.parse('2022-05-22 22:13:04'), Info: 'Commented “Love the design on this!!!”.'),
    tempNotification(name: 'Google', time: DateTime.parse('2022-05-22 20:43:04'), Info: 'Accepted your request.'),
    tempNotification(name: 'Baris Hocam', time: DateTime.parse('2022-05-22 16:28:04'), Info: 'Liked your photo.'),
    tempNotification(name: 'Safwan', time: DateTime.parse('2022-05-22 12:09:04'), Info: 'Blocked you.'),
    tempNotification(name: 'Fawaz', time: DateTime.parse('2022-05-22 08:55:04'), Info: 'Rejected your follow request.'),
    tempNotification(name: 'Elon Musk', time: DateTime.parse('2022-05-22 04:51:04'), Info: 'Sent you an Idea.'),
    tempNotification(name: 'Melin', time: DateTime.parse('2022-05-22 00:42:04'), Info: 'Liked your post.'),
  ];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryDark,
        title: Text(
          'Notifications',
          style: navBarHeadingStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: tempNoti.map((tempNotificaiton) => notificationCard(
                tempNoti: tempNotificaiton,
              )).toList(),
            ),
          ],
        ),
      ),
    ));
  }
}
