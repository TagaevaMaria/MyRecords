import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/results.dart';

class AddRecordScreenModel extends ChangeNotifier {
  final controllerNameTrening = TextEditingController();
  final controllerDescriptionTrening = TextEditingController();
  final controllerRecords = TextEditingController();
  final controllerData = TextEditingController();

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
        myRecord: record,
        dateTrening: date);
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
    final box = await Hive.openBox('description_trening_box');
    final results = Results(
        nameTrening: nameTrening,
        descriptionTrening: descriptionTrening,
        myRecord: record,
        dateTrening: date);
    await box.add(results);
    controllerDescriptionTrening.clear();
    notifyListeners();
  }

  ///Блок сохранения "Рекорд"
  var record = '';

  void _saveRecord(BuildContext context) async {
    if (record.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox('record_box');
    final results = Results(
        nameTrening: nameTrening,
        descriptionTrening: descriptionTrening,
        myRecord: record,
        dateTrening: date);
    await box.add(results);
    controllerRecords.clear();
    notifyListeners();
  }

  ///Блок сохранения "Дата"
  var date = '';

  void _saveDate(BuildContext context) async {
    if (date.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox('date_box');
    final results = Results(
        nameTrening: nameTrening,
        descriptionTrening: descriptionTrening,
        myRecord: record,
        dateTrening: date);
    await box.add(results);
    controllerData.clear();
    notifyListeners();
  }

  ///общий метод,который сохранит [_saveNameTrening], [_saveDescriptionTrening], [_saveRecord], [_saveDate]

  void saveResult(BuildContext context) {
    _saveNameTrening(context);
    _saveDescriptionTrening(context);
    _saveRecord(context);
    _saveDate(context);
    notifyListeners();
  }

  /// Календарь.ГААААД вонючий
  DateTime myDateTime = DateTime.now();

  calendar(BuildContext context) async {
    final data = await showDatePicker(
      context: context,
      initialDate: myDateTime,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      selectableDayPredicate: (data) {
        myDateTime = data;
        return true;
      },
    );
    if (data != null) {
      myDateTime = data;
    }
    notifyListeners();
  }
}
