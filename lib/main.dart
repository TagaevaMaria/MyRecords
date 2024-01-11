import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_records/screens/home_screen.dart';

import 'navigation/main_navigation.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      initialRoute: MainNavigationRoutsName.authScreen,
      routes: mainNavigation.routes,
    );
  }
}
