import 'dart:io' show Platform;
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_file/util/colors.dart';
import 'package:project_file/util/dimensions.dart';
import 'package:project_file/util/screenSizes.dart';
import 'package:project_file/util/styles.dart';
import 'package:project_file/util/buttonStyling.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_file/util/auth.dart';
import 'package:project_file/model/classes.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();

  static const String routeName = '/signup';
}

class _SignUpState extends State<SignUp> {
  int loginCounter = 0;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String userName = '';
  String pass = '';
  String confirmPass = '';
  final String googleIcon = 'assets/icons/googleLogo.svg';
  final String appLogo = 'assets/icons/appLogo.png';
  final String bg = 'assets/backgrounds/lsBg.png';

  final AuthService _auth = AuthService();

  Future registerUser() async {
    dynamic result = await _auth.registerUserWithEmailPass(email, pass);
    if(result is String) {
      _showDialog('Sign Up Error', result);
    } else if (result is UserCredential) {
      //User signed in
      Navigator.pushNamedAndRemoveUntil(context, '/bottomNav', (route) => false);
    } else {
      _showDialog('Login Error', result.toString());
    }
  }

  Future<void> _showDialog(String title, String message) async {
    bool isAndroid = Platform.isAndroid;
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if(isAndroid) {
            return AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(message),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          } else {
            return CupertinoAlertDialog(
              title: Text(title, style: lsInputTextStyle),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(message, style: lsInputTextStyle),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'LOGIN',
      //     style: kAppBarTitleTextStyle,
      //   ),
      //   backgroundColor: AppColors.primary,
      //   centerTitle: true,
      //   elevation: 0.0,
      // ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: screenWidth(context)/1.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Image.asset(
                              appLogo,
                              width: screenHeight(context)/8.44,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                            child: Text(
                              'LightBulb',
                              style: appNameHeadingStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 25, 40),
                            child: Container(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                      // padding: EdgeInsets.all(0),
                                      width: screenWidth(context, dividedBy: 1.1),
                                      height: screenHeight(context, dividedBy: 21),
                                      child: TextFormField(
                                        // keyboardType: TextInputType.emailAddress,
                                        style: lsInputTextStyle,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: AppColors.white,
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: AppColors.white,
                                              )
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: AppColors.white,
                                            ),
                                          ),
                                          errorStyle: lsErrorTextStyle,
                                          label: Container(
                                            width: 60,
                                            child: const Text('Username'),
                                          ),
                                          fillColor: AppColors.primary,

                                          filled: true,
                                          labelStyle: lsInputTextStyle,
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 3,
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        validator: (value) {
                                          if(value != null){
                                            if(value.isEmpty) {
                                              return 'Cannot leave username empty';
                                            }
                                            // if(!EmailValidator.validate(value)) {
                                            //   return 'Please enter a valid e-mail address';
                                            // }
                                          }
                                        },
                                        onSaved: (value) {
                                          userName = value ?? '';
                                        },
                                      ),
                                      // decoration: lsInputBoxStyle,
                                    ),

                                    Container(
                                      // padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                      // padding: EdgeInsets.all(0),
                                      width: screenWidth(context, dividedBy: 1.1),
                                      height:  screenHeight(context, dividedBy: 21),
                                      child: TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        style: lsInputTextStyle,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: AppColors.white,
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: AppColors.white,
                                              )
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: AppColors.white,
                                            ),
                                          ),
                                          errorStyle: lsErrorTextStyle,
                                          label: Container(
                                            width: 40,
                                            child: const Text('Email'),
                                          ),
                                          fillColor: AppColors.primary,

                                          filled: true,
                                          labelStyle: lsInputTextStyle,
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 3,
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        validator: (value) {
                                          if(value != null){
                                            if(value.isEmpty) {
                                              return 'Cannot leave e-mail empty';
                                            }
                                            if(!EmailValidator.validate(value)) {
                                              return 'Please enter a valid e-mail address';
                                            }
                                          }
                                        },
                                        onSaved: (value) {
                                          email = value ?? '';
                                        },
                                      ),
                                      // decoration: lsInputBoxStyle,
                                    ),

                                    Container(
                                      // padding: EdgeInsets.all(8),
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                      width: screenWidth(context, dividedBy: 1.1),
                                      height:  screenHeight(context, dividedBy: 21),
                                      child: TextFormField(
                                        style: lsInputTextStyle,
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: AppColors.white,
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: AppColors.white,
                                              )
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: AppColors.white,
                                            ),
                                          ),
                                          errorStyle: lsErrorTextStyle,
                                          label: Container(
                                            width: 75,
                                            child: const Text('Password'),
                                          ),
                                          fillColor: AppColors.primary,
                                          filled: true,
                                          labelStyle: lsInputTextStyle,
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: AppColors.white,
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        validator: (value) {
                                          if(value != null){
                                            if(value.isEmpty) {
                                              return 'Cannot leave password empty';
                                            }
                                            if(value.length < 6) {
                                              return 'Password too short';
                                            }
                                          }
                                        },
                                        onSaved: (value) {
                                          pass = value ?? '';
                                        },
                                      ),
                                    ),

                                    Container(
                                      // padding: EdgeInsets.all(8),
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                      width: screenWidth(context, dividedBy: 1.1),
                                      height:  screenHeight(context, dividedBy: 21),
                                      child: TextFormField(
                                        style: lsInputTextStyle,
                                        keyboardType: TextInputType.text,
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: AppColors.white,
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: AppColors.white,
                                              )
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: AppColors.white,
                                            ),
                                          ),
                                          errorStyle: lsErrorTextStyle,
                                          label: Container(
                                            width: 75,
                                            child: const Text('Password'),
                                          ),
                                          fillColor: AppColors.primary,
                                          filled: true,
                                          labelStyle: lsInputTextStyle,
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: AppColors.white,
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        validator: (value) {
                                          if(value != null){
                                            if(value.isEmpty) {
                                              return 'Cannot leave password empty';
                                            }
                                            if(value.length < 6) {
                                              return 'Password too short';
                                            }
                                          }
                                        },
                                        onSaved: (value) {
                                          confirmPass = value ?? '';
                                        },
                                      ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                      child: OutlinedButton(
                                          onPressed: () async {
                                            if(_formKey.currentState!.validate()) {
                                              //print('Email: $email');
                                              _formKey.currentState!.save();
                                              await registerUser();
                                              // print('Email: $email');
                                              // User user = User(username: userName, email: email, password: pass);
                                              // print(user);
                                              // setState(() {
                                              //   loginCounter++;
                                              // });

                                            } else {
                                              _showDialog('Form Error', 'Your form is invalid');
                                            }
                                          },
                                          child: const Text(
                                            'Sign Up',
                                            style: lsButtonTextStyle,
                                          ),
                                          style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                color: Color(0x00000000),
                                              )
                                          )
                                      ),
                                      decoration: ButtonStyling.lsButton,
                                      height:  screenHeight(context, dividedBy: 21),

                                    ),
                                    // Container(
                                    //   margin: EdgeInsets.fromLTRB(0, 0, 0, 11),
                                    //   child: ElevatedButton.icon(
                                    //     onPressed: () {
                                    //     },
                                    //     // child: Padding(
                                    //     //   padding: const EdgeInsets.symmetric(vertical: 12.0),
                                    //     //   child: Row(
                                    //     //     // mainAxisAlignment: MainAxisAlignment.start,
                                    //     //     // crossAxisAlignment: CrossAxisAlignment.center,
                                    //     //     children: const [
                                    //     //       Icon(Icons.facebook, size: 20),
                                    //     //       Text(
                                    //     //       'Continue with Facebook',
                                    //     //       style: lsButtonTextStyle,
                                    //     //       ),
                                    //     //   ]
                                    //     //   ),
                                    //     // ),
                                    //     // style: OutlinedButton.styleFrom(
                                    //     //     side: const BorderSide(
                                    //     //       color: Color(0x00000000),
                                    //     //     )
                                    //     // )
                                    //     icon: const Icon(
                                    //       Icons.facebook,
                                    //       size: 25,
                                    //     ),
                                    //     label: const Text('Continue with Facebook'),
                                    //     style: ElevatedButton.styleFrom(
                                    //       shape: new RoundedRectangleBorder(
                                    //         borderRadius: new BorderRadius.circular(10),
                                    //       ),
                                    //       elevation: 0,
                                    //     ),
                                    //   ),
                                    //   height: 40,
                                    // ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          dynamic user = await _auth.signInWithFacebook();
                                          if(user != null) {
                                            Navigator.pushNamedAndRemoveUntil(context, '/bottomNav', (route) => false);
                                          }
                                          },
                                        // child: Padding(
                                        //   padding: const EdgeInsets.symmetric(vertical: 12.0),
                                        //   child: Row(
                                        //     // mainAxisAlignment: MainAxisAlignment.start,
                                        //     // crossAxisAlignment: CrossAxisAlignment.center,
                                        //     children: const [
                                        //       Icon(Icons.facebook, size: 20),
                                        //       Text(
                                        //       'Continue with Facebook',
                                        //       style: lsButtonTextStyle,
                                        //       ),
                                        //   ]
                                        //   ),
                                        // ),
                                        // style: OutlinedButton.styleFrom(
                                        //     side: const BorderSide(
                                        //       color: Color(0x00000000),
                                        //     )
                                        // )
                                        icon: const Icon(
                                            Icons.facebook,
                                            color: AppColors.white
                                        ),
                                        label: const Text(
                                            'Continue with Facebook',
                                            style: TextStyle(
                                              color: AppColors.white,
                                            )
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          elevation: 0,
                                          primary: const Color(0xff1778f2),
                                        ),
                                      ),
                                      height:  screenHeight(context, dividedBy: 21),

                                    ),
                                    Container(
                                      child: ElevatedButton.icon(
                                        onPressed: () async {
                                          dynamic user = await _auth.signInWithGoogle();
                                          if(user != null) {
                                            Navigator.pushNamedAndRemoveUntil(context, '/bottomNav', (route) => false);
                                          }
                                        },
                                        // child: Padding(
                                        //   padding: const EdgeInsets.symmetric(vertical: 12.0),
                                        //   child: Row(
                                        //     // mainAxisAlignment: MainAxisAlignment.start,
                                        //     // crossAxisAlignment: CrossAxisAlignment.center,
                                        //     children: const [
                                        //       Icon(Icons.facebook, size: 20),
                                        //       Text(
                                        //       'Continue with Facebook',
                                        //       style: lsButtonTextStyle,
                                        //       ),
                                        //   ]
                                        //   ),
                                        // ),
                                        // style: OutlinedButton.styleFrom(
                                        //     side: const BorderSide(
                                        //       color: Color(0x00000000),
                                        //     )
                                        // )
                                        icon: SvgPicture.asset(
                                            googleIcon
                                        ),
                                        label: const Text(
                                            'Continue with Google',
                                            style: TextStyle(
                                              color: Colors.black,
                                            )
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: const BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                          ),
                                          elevation: 0,
                                          primary: AppColors.white,
                                        ),
                                      ),
                                      height:  screenHeight(context, dividedBy: 21),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                                },
                                child: Text(
                                    "Already have an account? Sign In!",
                                    style: lsInputTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              AppColors.primaryLight,
                              AppColors.primaryLighter
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: screenHeight(context)/1.3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bg),
              fit: BoxFit.cover,
            )
        ),
      ),

    );
  }
}