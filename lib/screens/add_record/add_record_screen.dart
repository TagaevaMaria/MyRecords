import 'package:flutter/material.dart';
import 'package:my_records/widgets/show_date_picker .dart';
import 'package:provider/provider.dart';

import 'add_record_screen_model.dart';

class AddRecordScreenBody extends StatefulWidget {
  const AddRecordScreenBody({Key? key}) : super(key: key);

  @override
  State<AddRecordScreenBody> createState() => _AddRecordScreenBodyState();
}

class _AddRecordScreenBodyState extends State<AddRecordScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddRecordScreenModel(),
        child: const AddRecordScreen());
  }
}

class AddRecordScreen extends StatelessWidget {
  const AddRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<AddRecordScreenModel>();
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {},
          child: const Text(
            'Результат',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () => _model.saveResult(context),
              child: const Icon(
                Icons.check_rounded,
                color: Colors.red,
              )),
          TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
                onChanged: (value) => _model.nameTrening = value,
                controller: _model.controllerNameTrening,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Наименование тренировки')),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => _model.descriptionTrening = value,
              controller: _model.controllerDescriptionTrening,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Описание тренировки'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => _model.record = value,
              controller: _model.controllerRecords,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Рекорд'),
            ),
          ),
          Text(
            _model.dateTime.toString(),
          ),
          Container(
            color: Colors.red,
            height: 59.0,
            width: 395.4,
            child: const DatePickerExample(),
          ),
        ],
      ),
    );
  }
}
