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
        appBar: AppBar(
          title: const Text("Фото"),
        ),
        body: Column(
          children: [
            Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () => _model.showPicker(context),
                    child: Container(
                      width: 300,
                      height: 50,
                      color: Colors.blue,
                      child: const Center(child: Text('Выбрать изображение')),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.blue,
                  child: _model.selectedImgae != null
                      ? Image.file(
                          _model.selectedImgae!,
                          fit: BoxFit.fill,
                        )
                      : const Icon(Icons.add_a_photo),
                )
              ],
            )
          ],
        ));
  }
}

/// если после закрытия диалогового окна хочу передать результат, то делаем так Navigator.pop(context, result);
///GestureDetector(
//               onTap: () => _model.showPicker(context),
