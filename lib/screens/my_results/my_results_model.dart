import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/entity/results.dart';

class MyResultsModel extends ChangeNotifier {
  var _results = <Results>[];
  List<Results> get results => _results.toList();

  MyResultsModel() {
    _setapNameTrening();
    _setapDescriptionTrening();
    _setapRecord();
    _setapDataRecord();
  }

  ///Блок сохранения "Наименование тренировки"

  void deleteNameTrening({required int nameTreningIndex}) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox<Results>('name_trening_box');
    await box.deleteAt(nameTreningIndex);
    notifyListeners();
  }

  /// Метод, который сохраняет и показывает текст "Наименование тренировки"

  void _setapNameTrening() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox<Results>('name_trening_box');
    _results = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _results = box.values.toList();

      notifyListeners();
    });
  }

  ///Блок сохранения "Описание тренировки"

  var _descriptionTrening = <Results>[];
  List<Results> get descriptionTrening => _descriptionTrening.toList();

  void _setapDescriptionTrening() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox<Results>('description_trening');
    _descriptionTrening = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _descriptionTrening = box.values.toList();
      notifyListeners();
    });
  }

  ///Блок сохранения "Рекорд"

  var _record = <Results>[];
  List<Results> get record => _record.toList();

  void _setapRecord() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox<Results>('record');
    _record = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _record = box.values.toList();
      notifyListeners();
    });
  }

  ///блок схранения даты рекорда
  var _dataRecord = <Results>[];
  List<Results> get dataRecord => _dataRecord.toList();

  void _setapDataRecord() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox<Results>('date_box');
    _dataRecord = box.values.toList();
    notifyListeners();
    box.listenable().addListener(() {
      _dataRecord = box.values.toList();
      notifyListeners();
    });
  }

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
  }
}


