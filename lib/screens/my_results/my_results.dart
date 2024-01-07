import 'package:flutter/material.dart';
import 'package:my_records/screens/my_results/my_results_model.dart';
import 'package:provider/provider.dart';

import '../../di/di_container.dart';

class MyResultsBody extends StatelessWidget {
  const MyResultsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DIContainer.myResults();
  }
}

class MyResults extends StatelessWidget {
  const MyResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.watch<MyResultsModel>();
    final myDateTime =
        context.select((MyResultsModel value) => value.myDateTime);

    return Scaffold(
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Dismissible(
                  key: Key(_model.results.toString()),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Text(
                              myDateTime.toString().substring(0, 10),
                            ),
                            Row(
                              children: [
                                const Text('Тренировка: '),
                                Text(
                                  _model.results[index].nameTrening,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Описание: '),
                                Text(_model.results[index].descriptionTrening),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Рекорд: '),
                                Text(_model.results[index].myRecord),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: _model.results.length),
    );
  }
}
