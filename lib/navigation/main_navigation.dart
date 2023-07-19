import 'package:flutter/material.dart';

import '../screens/auth_screen/auth_screen.dart';
import '../screens/home_screen.dart';

abstract class MainNavigationRoutsName {
  static const authScreen = '/AuthScreen';
  static const homeScreen = '/HomeScreen';
}

class MainNavigation {
  initialRoute() => MainNavigationRoutsName.authScreen;
  final routes = <String, Widget Function(BuildContext)>{
    '/AuthScreen': (BuildContext context) => const AuthScreenBody(),
    '/HomeScreen': (BuildContext context) => const HomeScreen()
  };
}
