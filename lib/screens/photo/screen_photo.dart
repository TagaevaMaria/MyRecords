import 'package:flutter/material.dart';
import 'package:my_records/screens/photo/screen_photo_model.dart';
import 'package:provider/provider.dart';

import '../../di/di_container.dart';

class ScreenPhotoBody extends StatelessWidget {
  const ScreenPhotoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DIContainer.addFoto();
  }
}

class ScreenFoto extends StatelessWidget {
  const ScreenFoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.watch<ScreenFotoModel>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _model.showPicker(context),
        child: const Icon(Icons.add_a_photo),
      ),
      appBar: AppBar(
        title: const Text("Фото"),
      ),
      body: GridView.builder(
        itemCount: _model.listImages.length,
        itemBuilder: (BuildContext context, int index) {
          return _model.image != null
              ? Image.file(_model.image!)
              : Text('l;mjnjkn');
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
