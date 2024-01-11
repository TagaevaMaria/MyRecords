import 'package:flutter/material.dart';
import 'package:my_records/di/di_container.dart';
import 'package:my_records/screens/notes/my_notes_model.dart';
import 'package:provider/provider.dart';


class MyNotesBody extends StatelessWidget {
  const MyNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DIContainer.myNotes() ;
  }
}

class ScreenMyNotes extends StatelessWidget {
  const ScreenMyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.watch<MyNotesModel>();
    return const Scaffold(
      body: Center(child: Text('ffff')),
    );
  }
}
