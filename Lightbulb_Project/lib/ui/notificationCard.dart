import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_file/util/colors.dart';
import 'package:project_file/util/screenSizes.dart';
import 'package:project_file/util/styles.dart';

import '../model/classes.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import '../routes/settings.dart';

class notificationCard extends StatelessWidget {
  final tempNotification tempNoti;

  const notificationCard({Key? key, required this.tempNoti}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Container(
              height: 70,
              width: 70,
              child: OutlinedButton(
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                  color: AppColors.primaryLightest,
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: AppColors.primaryLighter,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  side: BorderSide(color: AppColors.secondaryLight, width: 1),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: screenWidth(context)/26,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tempNoti.name,
                    style: fromNotificationStyle),
                Text(
                  tempNoti.Info,
                  style: notificationInfo
                )
              ],
            ),
            Spacer(),
            Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(DateFormat().add_jm().format(tempNoti.time),
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: AppColors.primaryLightest,
                        fontWeight: FontWeight.w800,
                      )),
                ),
              ],
            ),
            SizedBox(width: 5,)
          ],
        ),
        Divider(
          height: 25,
          thickness: 1,
          color: AppColors.secondaryLight,
        )
      ],
    );
  }
}
