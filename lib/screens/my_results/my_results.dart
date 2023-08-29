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

    return Scaffold(
      body: ListView.builder(
          itemCount: _model.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Dismissible(
                  key: Key(_model.results.toString()),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                const Text('Дата'),
                                Text(
                                  _model.results[index].nameTrening,
                                ),
                                Text(_model.results[index].descriptionTrening),
                                Text(_model.results[index].myRecord),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () => _model.deleteNameTrening(
                                  nameTreningIndex: index),
                              icon: Icon(Icons.delete))
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
