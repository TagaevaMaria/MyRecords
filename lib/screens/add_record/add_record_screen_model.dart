import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/results.dart';
import '../../navigation/main_navigation.dart';

class AddRecordScreenModel extends ChangeNotifier {
  final controllerNameTrening = TextEditingController();
  final controllerDescriptionTrening = TextEditingController();
  final controllerRecords = TextEditingController();

  var nameTrening = '';

  ///Метод сохранение имя тренировки
  saveNameTrening(BuildContext context) async {
    if (nameTrening.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox<Results>('name_trening_box');
    final results = Results(nameTrening: nameTrening);
    await box.add(results);
    Navigator.pushReplacementNamed(
        context, MainNavigationRoutsName.myResultsBody);
    notifyListeners();
  }
}
