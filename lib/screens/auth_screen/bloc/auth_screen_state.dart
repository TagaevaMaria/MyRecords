import 'package:flutter/cupertino.dart';

import '../../../navigation/main_navigation.dart';

abstract class AuthScreenState {}

class ErorrState extends AuthScreenState {
  void navig(BuildContext context) {
    Navigator.pushNamed(context, MainNavigationRoutsName.homeScreen);
  }
}
