import 'dart:io' show Platform;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_file/routes/welcome.dart';
import 'package:project_file/util/colors.dart';
import 'package:project_file/util/dimensions.dart';
import 'package:project_file/util/screenSizes.dart';
import 'package:project_file/util/styles.dart';
import 'package:project_file/util/buttonStyling.dart';
import 'package:project_file/util/auth.dart';

import '../model/classes.dart';
import '../ui/post_card.dart';
//import '..lib//Post.dart';
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Settings",
            style: GoogleFonts.nunito(
              color: AppColors.primary,
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
            )
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondaryDark,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: AppColors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryDark,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "Content settings"),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.volume_up_outlined,
                  color: AppColors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryDark,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                child: OutlinedButton(
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                    },
                    child: const Text(
                      'Sign Out',
                      style: lsButtonTextStyle,
                    ),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0x00000000),
                        )
                    )
                ),
                decoration: ButtonStyling.lsButton,
                height: 40,

              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.grey,
          ),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: AppColors.secondaryDark,
              value: isActive,
              onChanged: (bool val) {
                setState((){
                  isActive = false;
                });
              },
            )
        )
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
