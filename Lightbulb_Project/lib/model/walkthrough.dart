import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_file/routes/feed.dart';
import 'package:project_file/routes/login.dart';
import 'package:project_file/routes/signup.dart';
import 'package:project_file/routes/welcome.dart';
import 'package:project_file/util/screenSizes.dart';
import 'package:project_file/util/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../util/colors.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({Key? key}) : super(key: key);

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  final controller = PageController();
  bool isLastPage = false;
  final int numPages = 7;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth(context)/21.1),
              child: Image.asset(
                urlImage,
                height: 400,
                // fit: BoxFit.fitWidth
              ),
            ),
            Text(
              title,
              style: walkthroughHeading,
            ),
            // const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      subtitle,
                      style: walkthroughDescription,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Walkthrough",
            style: navBarHeadingStyle),
        centerTitle: true,
        backgroundColor: AppColors.secondaryDark,
        elevation: 1,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (index) {
            setState(() => isLastPage = index == numPages - 1);
          },
          controller: controller,
          children: [
            buildPage(
                urlImage: 'assets/icons/appLogo.png',
                title: "Welcome",
                subtitle: "LightBulb is an app for sharing amd exploring ideas and knowledge."),
            buildPage(
                urlImage: 'assets/walkthrough/Login.png',
                title: "Login",
                subtitle:
                    "If you already have an account, you can login, else feel free to create an account!"),
            buildPage(
                urlImage: 'assets/walkthrough/Feed.png',
                title: "Main Feed",
                subtitle:
                    "Here you'll see all the ideas posted by everyone you follow."),
            buildPage(
                urlImage: 'assets/walkthrough/SearchAndExplore.png',
                title: "Search and Explore",
                subtitle:
                "Explore posts on a variety of educational topics"),
            buildPage(
                urlImage: 'assets/walkthrough/CreatePost.png',
                title: "Add your idea",
                subtitle:
                "Create a post to showcase your brilliant idea or to spread knowledge. LightBulb also allows you to attach files alongside!"),
            buildPage(
                urlImage: 'assets/walkthrough/Notifications.png',
                title: "Notifications",
                subtitle:
                "All your important notifications will be presented on your 'Notifications' page"),
            buildPage(
                urlImage: 'assets/walkthrough/Profile.png',
                title: "Profile",
                subtitle:
                    "Here, you can see your posts, profile details and edit your profile at any time"),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: Text(
                          'Prev',
                        style: walkthroughStyle,
                      )
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: numPages,
                      effect: const WormEffect(
                        spacing: 10,
                        dotColor: AppColors.greyDarker,
                        activeDotColor: AppColors.secondaryDark,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Welcome()),
                        );
                      },
                      child: Text(
                          'Start',
                        style: walkthroughStyle,
                      )
                  )
                ],
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: Text(
                          'Prev',
                        style: walkthroughStyle,
                      )
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: numPages,
                      effect: const WormEffect(
                        spacing: 10,
                        dotColor: AppColors.greyDarker,
                        activeDotColor: AppColors.secondaryDark,
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: Text(
                          'Next',
                        style: walkthroughStyle,
                      )
                  )
                ],
              ),
            ),
    );
  }
}
