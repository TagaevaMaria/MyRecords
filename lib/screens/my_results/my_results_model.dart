import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/entity/results.dart';

class MyResultsModel extends ChangeNotifier {
  var _results = <Results>[];
  List<Results> get results => _results.toList();

  MyResultsModel() {
    _setapNameTrening();
  }

  ///Блок сохранения "Наименование тренировки"

  void deleteNameTrening({required int nameTreningIndex}) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ResultsAdapter());
    }
    final box = await Hive.openBox<Results>('name_trening_box');
    await box.deleteAt(nameTreningIndex);
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
}
