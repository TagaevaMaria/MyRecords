import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/results.dart';

class AddRecordScreenModel extends ChangeNotifier {
  final controllerNameTrening = TextEditingController();
  final controllerDescriptionTrening = TextEditingController();
  final controllerRecords = TextEditingController();

  var nameTrening = '';

  ///Метод сохранение имя тренировки
  void _saveNameTrening(BuildContext context) async {
    if (nameTrening.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox<Results>('name_trening_box');
    final results = Results(
        nameTrening: nameTrening,
        descriptionTrening: descriptionTrening,
        myRecord: myRecord);
    await box.add(results);
    controllerNameTrening.clear();

    notifyListeners();
  }

  ///Блок сохранения "Описание тренировки"
  var descriptionTrening = '';

  void _saveDescriptionTrening(BuildContext context) async {
    if (descriptionTrening.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox('description_trening');
    final results = Results(
        nameTrening: nameTrening,
        descriptionTrening: descriptionTrening,
        myRecord: myRecord);
    await box.add(results);
    controllerDescriptionTrening.clear();
    notifyListeners();
  }

  ///Блок сохранения "Рекорд"
  var myRecord = '';

  void _savemyRecord(BuildContext context) async {
    if (descriptionTrening.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox('my_record');
    final results = Results(
        nameTrening: nameTrening,
        descriptionTrening: descriptionTrening,
        myRecord: myRecord);
    await box.add(results);
    controllerRecords.clear();
    notifyListeners();
  }

  ///общий метод,который сохранит [_saveNameTrening], [_saveDescriptionTrening], [_savemyRecord]

  void saveResult(BuildContext context) {
    _saveNameTrening(context);
    _saveDescriptionTrening(context);
    _savemyRecord(context);
    notifyListeners();
  }
}
