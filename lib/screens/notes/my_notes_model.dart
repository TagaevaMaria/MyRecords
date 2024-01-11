import 'package:flutter/material.dart';

//тренировка, повторение теории.

class MyNotesModel extends ChangeNotifier {
  final fff = Notes(crok: 12, myDate: 1, name: 'jfjjf');

}

///мое обучение, потом удалить.
class Notes {
  Notes({required this.crok, required this.myDate, required this.name});

  int myDate;
  final String name;
  int crok;
}
