import 'package:flutter/material.dart';

import '../screens/auth_screen/auth_screen.dart';
import '../screens/home_screen.dart';
import '../screens/my_results/my_results.dart';
import '../screens/photo/screen_photo.dart';

abstract class MainNavigationRoutsName {
  static const authScreen = '/AuthScreen';
  static const homeScreen = '/HomeScreen';
  static const myResultsBody = '/MyResultsBody';
  static const screenPhotoBody = '/ScreenPhotoBody';
}

class MainNavigation {
  initialRoute() => MainNavigationRoutsName.authScreen;
  final routes = <String, Widget Function(BuildContext)>{
    '/AuthScreen': (BuildContext context) => const AuthScreenBody(),
    '/HomeScreen': (BuildContext context) => HomeScreen(),
    '/MyResultsBody': (BuildContext context) => const MyResultsBody(),
    '/ScreenPhotoBody': (BuildContext context) => ScreenPhotoBody(),
  };
}
