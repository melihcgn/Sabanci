import 'package:flutter/material.dart';
import 'package:project_file/routes/login.dart';
import 'package:project_file/routes/signup.dart';
import 'package:project_file/routes/welcome.dart';
import 'package:project_file/ui/bottomNav.dart';
import 'package:project_file/util/auth.dart';
import 'package:project_file/util/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'analytics.dart';
import 'model/walkthrough.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_file/util/colors.dart';
import 'package:project_file/util/createMaterialColor.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key, required this.analytics}) : super(key: key);
  const MyApp({Key? key}) : super(key: key);

  // final FirebaseAnalytics analytics;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;


  int? firstLoad;
  SharedPreferences? prefs;
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  decideRoute() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      firstLoad = (prefs!.getInt('appInitialLoad') ?? 0);
    });
  }

  @override
  void initState() {
    super.initState();
    decideRoute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return ErrorScreen(message: snapshot.error.toString());
          }
          if(snapshot.connectionState == ConnectionState.done) {
            if(firstLoad == null) {
              return Container();
            }
            else if(firstLoad == 0) {
              firstLoad = 1; // 1 for normal, 0 for debug
              prefs!.setInt('appInitialLoad', firstLoad!);
              // setCurrentScreen(widget.analytics, 'Walkthrough', 'walkthrough-page');
              return MaterialApp(
                  home: WalkThrough(),
                  routes: {
                    // '/': (context) => Login(),
                    SignUp.routeName: (context) => SignUp(),
                    Login.routeName: (context) => Login(),
                    BottomNav.routeName: (context) => const BottomNav(),
                    Welcome.routeName: (context) => Welcome(),
                  },
                  theme: ThemeData(
                      primarySwatch: createMaterialColor(AppColors.secondaryDark)
                  )
              );
            }
            else {
              // return StreamProvider<User?>.value(
              //   value: AuthService().user,
              //   initialData: null,
              //   child: AuthenticationStatus(),
              // );
              return MaterialApp(
                  routes: {
                    '/': (context) => FirebaseAuth.instance.currentUser == null ? Login() : const BottomNav(),
                    SignUp.routeName: (context) => SignUp(),
                    Login.routeName: (context) => Login(),
                    BottomNav.routeName: (context) => const BottomNav(),
                    Welcome.routeName: (context) => Welcome(),
                  },
                  theme: ThemeData(
                      primarySwatch: createMaterialColor(AppColors.secondaryDark)
                  )
              );
            }
          }
          return const WaitingScreen();
        },
    );

  }
}
class AuthenticationStatus extends StatefulWidget {
  const AuthenticationStatus({Key? key}) : super(key: key);

  @override
  State<AuthenticationStatus> createState() => _AuthenticationStatusState();
}

class _AuthenticationStatusState extends State<AuthenticationStatus> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if(user == null) {
      return MaterialApp(
          routes: {
            '/': (context) => Welcome(),
            SignUp.routeName: (context) => SignUp(),
            Login.routeName: (context) => Login(),
            BottomNav.routeName: (context) => const BottomNav(),
            Welcome.routeName: (context) => Welcome(),
          },
          theme: ThemeData(
              primarySwatch: createMaterialColor(AppColors.secondaryDark)
          )
      );
    } else {
      return MaterialApp(
          routes: {
            '/': (context) => const BottomNav(),
            SignUp.routeName: (context) => SignUp(),
            Login.routeName: (context) => Login(),
            BottomNav.routeName: (context) => const BottomNav(),
            Welcome.routeName: (context) => Welcome(),
          },
          theme: ThemeData(
              primarySwatch: createMaterialColor(AppColors.secondaryDark)
          )
      );
    }
  }
}


class ErrorScreen extends StatelessWidget {
  final String appLogo = 'assets/icons/appLogo.png';
  final String bg = 'assets/backgrounds/lsBg.png';
  const ErrorScreen({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LightBulb'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  appLogo,
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                  child: Text(
                    'LightBulb',
                    style: appNameHeadingStyle,
                  ),
                ),
                Text(
                  message,
                  style: walkthroughDescription,
                )
              ],
            )
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bg),
                fit: BoxFit.cover,
              )
          ),
        ),

      ),
    );

  }
}

class WaitingScreen extends StatelessWidget {
  final String appLogo = 'assets/icons/appLogo.png';
  final String bg = 'assets/backgrounds/lsBg.png';
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  appLogo,
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                  child: Text(
                    'LightBulb',
                    style: appNameHeadingStyle,
                  ),
                ),
                Text(
                    'Connecting to Firebase',
                    style: appNameHeadingStyle,
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bg),
                fit: BoxFit.cover,
              )
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//     required this.title,
//     required this.analytics
//   }) : super(key: key);
//
//   final String title;
//   final FirebaseAnalytics analytics;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

