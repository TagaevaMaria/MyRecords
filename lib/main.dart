import 'package:flutter/material.dart';
import 'package:my_records/screens/auth_screen.dart';

import 'navigation/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainNavigationRoutsName.authScreen,
      home: const AuthScreen(),
      routes: mainNavigation.routes,
    );
  }
}
