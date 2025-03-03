import 'dart:io';
import 'dart:io' show Platform;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

User user = User( TempUsername: 'Fawaz Mirza', pass: 'password', Email: 'WeNeedAnA@please.com', Location: 'IST, Turkey', post1: Post1(caption: 'caption', topics: ["#topics"], image: 'https://www.tenforums.com/geek/gars/images/2/types/thumb_15951118880user.png', likes: 0, comments:  0));

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
   static const String routeName = '/editprof';
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false; String newUsername = user.TempUsername;
  String newEmail= user.Email; String newLoc = user.Location; String newPass = user.pass;
  //String newProf = user.profilepic;
  File? image;


  //image == null ? Icon(Icons.man) : Image.file(image);
  Future pickImage(ImageSource source) async{
    try {
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;
      final imageTemporary = File(image.path);
      //imageTemporary = '';
      setState((){
        this.image = imageTemporary;
        //newProf = image.path;
       });
    } on PlatformException catch (e) {
      print('Failed to pick an image.');
    }
  }

  void showToast(String message) => Fluttertoast.showToast(
      msg: message,
    fontSize: 18.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(
            "Edit Profile",
            style: navBarHeadingStyle
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondaryDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: AppColors.primary,
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: screenHeight(context)/56.3,
              ),
              Center(
                child: Stack(
                  children: [

                    Container(
                     // color: AppColors.secondaryDark,
                      width: screenWidth(context)/3,
                      height: screenWidth(context)/3,
                     child: image != null ? ClipOval(
                       child: Image.file(
                         image!,
                         width: screenWidth(context)/2.5,
                         height: screenWidth(context)/2.5,
                         fit: BoxFit.cover,
                       )
                     ) : ClipOval(
                       child: Image.network(
                         'https://www.tenforums.com/geek/gars/images/2/types/thumb_15951118880user.png',
                     ),
                )
                     //child: ,
                     // decoration: BoxDecoration(
                      //    border: Border.all(
                      //        width: 4,
                       //       color: AppColors.secondaryDark,
                       //   ),
                         // boxShadow: [
                         //   BoxShadow(
                         //       spreadRadius: 2,
                         //       blurRadius: 10,
                         //       color: Colors.black.withOpacity(0.1),
                          //      offset: Offset(0, 10))
                        //  ],
                        //  shape: BoxShape.circle,
                         // image: DecorationImage(
                         //     fit: BoxFit.cover,
                            //  image: NetworkImage(
                            //    "https://www.tenforums.com/geek/gars/images/2/types/thumb_15951118880user.png",
                              //)
                         // )
                     // ),

                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                         // color: AppColors.white,
                          height: screenWidth(context)/9.75,
                          width:  screenWidth(context)/9.75,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: AppColors.secondaryDark,

                          ),
                          child: Stack(
                            children: [
                                  Positioned(
                                  //top: 0,
                                  right: -9,
                                  //left: 0,
                                  bottom: -9,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: AppColors.white,
                                    ),
                                    onPressed: () {
                                      pickImage(ImageSource.camera);
                                    },
                                  ),
                              ),
                            ],
                        ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:  screenHeight(context)/24.1,
              ),
              buildTextField("Full Name", user.TempUsername, false),
              buildTextField("E-mail", user.Email, false),
              buildTextField("Password", user.pass, true), // will implement user.pass properly later on
              buildTextField("Location", "IST, Turkey", false),
              SizedBox(
                height: screenHeight(context)/24.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                    width: screenWidth(context)/2.3,
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if(newUsername.contains(new RegExp(r'[A-Z]'))){
                              user.TempUsername = newUsername;
                            }

                            user.Email = newEmail;
                            user.Location = newLoc;
                            user.pass = newPass;
                          //  user.profilepic = newProf;
                           // print(newProf);
                          }

                          );

                          Navigator.of(context).pop();
                          showToast('User Information Updated.');
                        },
                        child: const Text(
                          'SAVE',
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
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 11),
                    width: screenWidth(context)/2.3,
                    child: OutlinedButton(
                      child: const Text(
                          'CANCEL',
                        style: lsButtonTextStyleAlter,
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: AppColors.primary,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        side: const BorderSide(color: AppColors.grey, width: 3),
                      ),
                      onPressed: () {
                        print('Pressed');
                        Navigator.of(context).pop();
                      },
                    ),
                    //decoration: ButtonStylingAlter.lsButton,
                    height: screenHeight(context)/21.1,

                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        style: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.grey,
        ),
        onChanged: (text){
          if(labelText == "Full Name") {
            if(text.contains(new RegExp(r'[a-z]')) || text.contains(new RegExp(r'[A-Z]'))){
              newUsername = text;
            }else{
              showToast('Username can not be empty.');
            }
          }
          if(labelText == "E-mail") {
            newEmail = text;
          }
         if(labelText == "Password") {
           newPass = text;
         }
          if(labelText == "Location") {
            newLoc = text;
          }
        },
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: const Icon(
                Icons.remove_red_eye,
                color: AppColors.grey,
              ),
            )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryDark,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.grey,
            )
        ),
      ),
    );
  }
}
