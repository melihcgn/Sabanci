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
import '../model/classes.dart';
import '../ui/Topics.dart';
import '../util/dimensions.dart';
import '../util/createMaterialColor.dart';



class SearchAndExplore extends StatefulWidget {
  const SearchAndExplore({Key? key}) : super(key: key);

  @override
  State<SearchAndExplore> createState() => _SearchAndExploreState();
}

class _SearchAndExploreState extends State<SearchAndExplore> {
  List<topicsInSearch> topicsList = [
    topicsInSearch(Topic: "#Math", image: "https://www.theparisreview.org/blog/wp-content/uploads/2019/07/istock-512102071.jpg"),
    topicsInSearch(Topic: "#ComputerScience", image: "https://i.pinimg.com/736x/e9/88/b6/e988b66e788ce0f049190c4ec8587f17.jpg"),
    topicsInSearch(Topic: "#Biology", image: "https://data.whicdn.com/images/330805121/original.jpg?t=1558830645"),
    topicsInSearch(Topic: "#Psychology", image: "https://wallpaperaccess.com/full/6679227.png"),
    topicsInSearch(Topic: "#Mechatronics", image: "https://www.springwise.com/wp-content/uploads/2019/02/Tech_Explained_Dark_Data_Springwise.jpg"),
    topicsInSearch(Topic: "#Law", image: "https://thumbs.dreamstime.com/b/justice-law-background-concept-constitution-lawyer-aesthetics-justice-118485209.jpg"),
    topicsInSearch(Topic: "#Arts", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNde8XihrNaEYf5o5VkUzfJFe0AbJsCLFiGw&usqp=CAU"),
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
            'Explore',
            style: navBarHeadingStyle,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primary,
            ),
          ),
          actions: [
          ],
        ),
        body: Stack(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.all(8),
                  margin: const EdgeInsets.fromLTRB(0, 15, 0, 11),
                  height: screenHeight(context)/9,
                  width: screenWidth(context)/1.09,
                  child: TextFormField(
                    style: lsInputTextStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.white,
                            width: 1,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.white,
                            width: 1,
                          )
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.white,
                          width: 1,
                        ),
                      ),
                      errorStyle: lsErrorTextStyle,
                      label: Container(
                        width: screenWidth(context)/2.6,
                        child: const Text('Search for users or topics...', style: TextStyle(color: AppColors.grey),),
                      ),
                      fillColor: AppColors.primary,
                      filled: true,
                      labelStyle: lsInputTextStyle,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) {

                    },
                  ),
                )

              ],
            ),
            SafeArea(
              minimum: EdgeInsets.fromLTRB(0, screenHeight(context)/9, 0, 0),
              child: SingleChildScrollView(
              //  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        children: [

                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                            child: Column(

                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Column(
                                      children: topicsList
                                          .map((post) => topicsPost(
                                        topicsinsearch: post,
                                      ))
                                          .toList(),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      children: topicsList
                                          .map((post) => topicsPost(
                                        topicsinsearch: post,
                                      ))
                                          .toList(),
                                    ),
                                  ],
                                ), // instagram.com/fawaz.mirza.10
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                //),
              ),
            ),
          ],
        ),
      ),
    );
  }
}