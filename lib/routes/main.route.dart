import 'package:flutter/material.dart';
import 'package:profile_app_/screen/experience_page.dart';
import 'package:profile_app_/screen/home_page.dart'; // Add this import
import 'package:profile_app_/screen/interests_page.dart';
import '../mock_data/mock_data.dart'; // Add this import

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String home = '/';
  static const String exp = '/experience';
  static const String interest = '/interest';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const ProfilePage(),
    exp: (context) => ExperiencePage(
      experiences: MockData.getProfileData().workExperience, // Pass the data
    ),
    interest: (context) =>
        InterestsPage(interests: MockData.getProfileData().interests),
  };

  static Future<T?> push<T>(String routeName, {Object? arguments}) {
    if (navigatorKey.currentState == null) {
      debugPrint('Navigator state is not ready yet');
      return Future.value(null);
    }

    return navigatorKey.currentState!.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }
}
