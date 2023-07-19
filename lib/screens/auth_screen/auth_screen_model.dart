import 'package:flutter/cupertino.dart';

import '../../navigation/main_navigation.dart';

class AuthScreenModel extends ChangeNotifier {
  void prii() {
    print("5555555555555555");
  }

  final authController = TextEditingController();
  String? errorText = '';

  ///показывает ошибку, либо переходит на другой экран.
  void auth(BuildContext context) {
    final name = authController.text;
    if (name.isEmpty) {
      errorText = 'введите имя';
    } else {
      Navigator.pushNamed(context, MainNavigationRoutsName.homeScreen);
    }
    if (errorText == null) const Text('введите имя');
  }

  void navig(BuildContext context) {
    Navigator.pushNamed(context, MainNavigationRoutsName.homeScreen);
    ;
  }
}

/// инхерит
class AuthScreenModelProvider extends InheritedNotifier {
  final AuthScreenModel model;
  const AuthScreenModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static AuthScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AuthScreenModelProvider>();
  }

  static AuthScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<AuthScreenModelProvider>()
        ?.widget;
    return widget is AuthScreenModelProvider ? widget : null;
  }
}
