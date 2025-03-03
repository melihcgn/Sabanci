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
class CreatePost extends StatefulWidget {
  const  CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();

  static const String routeName = '/createpost';
}
class _CreatePostState extends State<CreatePost>{

  File? image;
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
  List<String> topicsList = ["#Math","#IveBeenDoingThisTooLong","#ComputerScience","#Psychology","#Mechatronics","#Flutter"];

 Widget topicswidget({required int number}) => ClipRRect(
   borderRadius: BorderRadius.circular(15.0),
       child: Container(
        color: AppColors.secondaryDark,
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Text(
              topicsList[number],
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text(
          'Create Post',
          style: navBarHeadingStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondaryDark,
        elevation: 0,
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
        // ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: SafeArea(
            // child: Padding(
            //  padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          //color: AppColors.secondaryDark,
                          height: screenHeight(context)/13,
                          width: screenWidth(context)/2.3,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                              child: OutlinedButton(
                                child: Icon(
                                  Icons.add,
                                  size: screenHeight(context)/18,
                                  color: AppColors.grey,
                                ),
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: AppColors.primary,
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  side: const BorderSide(color: AppColors.white, width: 1),
                                ),
                                onPressed: () {
                                  pickImage(ImageSource.gallery);
                                },
                              ),
                              //decoration: ButtonStylingAlter.lsButton,
                              height: screenHeight(context)/11.25,
                              width: screenHeight(context)/11.25,
                            ),
                            Container(
                              //color: AppColors.secondaryDark,
                              // width: 5,
                              // height: 5,
                              child: Text(
                                'Select Image',
                                style: createPostStyleSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                child: OutlinedButton(
                                  child: Icon(
                                    Icons.attach_file,
                                    size: screenHeight(context)/18,
                                    color: AppColors.grey,
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: AppColors.primary,
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                    side: const BorderSide(color: AppColors.white, width: 1),
                                  ),
                                  onPressed: () {
                                    print('Pressed');
                                  },
                                ),
                                //decoration: ButtonStylingAlter.lsButton,
                                height: screenHeight(context)/11.25,
                                width: screenHeight(context)/11.25,
                              ),
                              Container(
                                //color: AppColors.secondaryDark,
                                child: Text(
                                  'Attach File',
                                  style: createPostStyleSecondary,
                                ),
                              ),
                            ]
                        )

                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // padding: EdgeInsets.all(8),
                          margin: const EdgeInsets.fromLTRB(0, 11, 0, 0),
                          height: screenHeight(context)/12,
                          width: screenWidth(context)/1.14,
                          child: TextFormField(
                            style: lsInputTextStyle,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: AppColors.white,
                                    width: 1,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: AppColors.white,
                                    width: 1,
                                  )
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: AppColors.white,
                                  width: 1,
                                ),
                              ),
                              errorStyle: lsErrorTextStyle,
                              label: Container(
                                width: 100,
                                child: const Text('Write a caption...', style: TextStyle(color: AppColors.grey),),
                              ),
                              fillColor: AppColors.primary,
                              filled: true,
                              labelStyle: lsInputTextStyle,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onSaved: (value) {

                            },
                          ),
                        )

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // padding: EdgeInsets.all(8),
                          // margin: EdgeInsets.fromLTRB(0, 11, 0, 0),
                          height: screenHeight(context)/12,
                          width: screenWidth(context)/1.14,
                          child: TextFormField(
                            style: lsInputTextStyle,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: AppColors.white,
                                    width: 1,
                                  )
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: AppColors.white,
                                    width: 1,
                                  )
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: AppColors.white,
                                  width: 1,
                                ),
                              ),
                              errorStyle: lsErrorTextStyle,
                              label: Container(
                                width: 100,
                                child: const Text('Add Location', style: TextStyle(color: AppColors.grey),),
                              ),
                              fillColor: AppColors.primary,
                              filled: true,
                              labelStyle: lsInputTextStyle,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onSaved: (value) {

                            },
                          ),
                        )

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(11,0,11,0),
                          //color: AppColors.secondaryDark,
                          child: Text(
                            'Select a topic',
                            style: createPostStyleSecondary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0,5,0,11),
                          height: screenHeight(context)/24,
                          width: screenWidth(context)/1.14,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: topicsList.length,
                            separatorBuilder: (context, _) => SizedBox(width: 12),
                            itemBuilder: (context, index) => topicswidget(number: index),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       //color: AppColors.secondaryDark,
                //       height: MediaQuery.of(context).size.height/5.5,
                //       width: MediaQuery.of(context).size.height/2.3,
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: screenHeight(context)/4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                      child: OutlinedButton(
                          onPressed: () {

                          },
                          child: Text(
                            'Create',
                            style: GoogleFonts.nunito(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color(0x00000000),
                              )
                          )
                      ),
                      decoration: CreateButtonStyling.lsButton,
                      height: 60,
                      width: screenWidth(context)/1.2,
                    ),

                  ],
                ),
                //  ),
              ],
              //),
            ),
          ),
        ),
      ),
    );
  }
}
