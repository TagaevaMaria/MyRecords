import 'package:flutter/material.dart';
import 'package:my_records/screens/foto/screen_photo_model.dart';
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
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
            context: context,
            builder: (context) => (AlertDialog(
                  title: Row(
                    children: [
                      const Text('Выберите фото'),
                      const SizedBox(width: 50),
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  actions: [
                    _model.selectedImgae != null
                        ? Image.file(_model.selectedImgae!)
                        : const Center(child: Text('Веберите изображение')),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: TextButton(
                              onPressed: () {
                                _model.pickImageFromGallery();
                              },
                              child: const Text('Галлерея'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: TextButton(
                              onPressed: () {},
                              child: TextButton(
                                onPressed: () {
                                  _model.pickImageFromCamera();
                                },
                                child: const Text('Камера'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
      appBar: AppBar(
        title: const Text("Фото"),
      ),
    );
  }
}

/// если после закрытия диалогового окна хочу передать результат, то делаем так Navigator.pop(context, result);
