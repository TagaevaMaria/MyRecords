import 'package:flutter/material.dart';
import 'package:my_records/screens/my_results/my_results_model.dart';
import 'package:provider/provider.dart';

class MyResultsBody extends StatefulWidget {
  const MyResultsBody({Key? key}) : super(key: key);

  @override
  State<MyResultsBody> createState() => _MyResultsBodyState();
}

class _MyResultsBodyState extends State<MyResultsBody> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyResultsModel(),
      child: const _MyResults(),
    );
  }
}

class _MyResults extends StatefulWidget {
  const _MyResults({Key? key}) : super(key: key);

  @override
  State<_MyResults> createState() => _MyResultsState();
}

class _MyResultsState extends State<_MyResults> {
  @override
  Widget build(BuildContext context) {
    final _model = context.watch<MyResultsModel>();
    final _countResult = _model.results.length ?? 0;
    return Scaffold(
      body: ListView.builder(
          itemCount: _countResult,
          itemBuilder: (BuildContext context, int index) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

/*

/// Виджет моих записей рекордов.
class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: SizedBox.expand(),
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            Expanded(
              child: Card(
                child: SizedBox.expand(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
