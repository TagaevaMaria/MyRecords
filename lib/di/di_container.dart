import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_record/add_record_screen.dart';
import '../screens/add_record/add_record_screen_model.dart';
import '../screens/my_results/my_results.dart';
import '../screens/my_results/my_results_model.dart';

class DIContainer {
  static Widget myResults() {
    return ChangeNotifierProvider(
      create: (context) => MyResultsModel(),
      child: const MyResults(),
    );
  }

  static Widget addResults() {
    return ChangeNotifierProvider(
        create: (context) => AddRecordScreenModel(),
        child: const AddRecordScreen());
  }
}
