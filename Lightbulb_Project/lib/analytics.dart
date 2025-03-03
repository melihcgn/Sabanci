import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';


  Future<void> setUserId(FirebaseAnalytics analytics, String userID) async {
    await analytics.setUserId(userID);
  }
  Future<void> setCurrentScreen(FirebaseAnalytics analytics, String screenName, String screenClass) async {
    await analytics.setCurrentScreen(
        screenName: screenName,
        screenClassOverride: screenClass,
    );
  }

  Future<void> logCustomEvent(FirebaseAnalytics analytics) async {
    await analytics.logEvent(
        name: 'Project Group 30',
        parameters: <String, dynamic> {
          'string': 'string',
          'int': 310,
          'long': 1234567890123,
          'double': 310.202102,
          'bool': true,
        }
    );


}