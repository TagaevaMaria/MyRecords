import 'package:flutter/material.dart';

class AddRecordScreen extends StatelessWidget {
  const AddRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
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
      body: const Column(
        children: [
          Text('Дата'),
          Text('Наименование тренировки'),
          Text('Описание'),
          Text('Достижение'),
        ],
      ),
    );
  }
}
