import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/entity/results.dart';

class MyResultsModel extends ChangeNotifier {
  var _results = <Results>[];
  List<Results> get results => _results.toList();

  MyResultsModel() {
    _setap();
  }
  void _setap() async {
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
}
