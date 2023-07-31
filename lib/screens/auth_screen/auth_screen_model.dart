import 'package:flutter/material.dart';
import 'package:my_records/navigation/main_navigation.dart';

class AuthScreenModel extends ChangeNotifier {
  String error = '';
  final textController = TextEditingController(text: "5555");

  ///метод навигации на экран HomeScreens
  navigationHomeScreens(BuildContext context) {
    Navigator.pushReplacementNamed(context, MainNavigationRoutsName.homeScreen);
    notifyListeners();
  }

  /// Показать ошибку
  auth(BuildContext context) {
    final name = textController;
    if (textController.text.isEmpty) {
      error = 'Введите имя';
    } else {
      navigationHomeScreens(context);
    }
    notifyListeners();
  }
}
