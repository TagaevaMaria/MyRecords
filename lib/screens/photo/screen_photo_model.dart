import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenFotoModel extends ChangeNotifier {
  ///Метод,который выбирает изображение из галлереи.

  File? image;
  final picker = ImagePicker();

  final List<XFile> listImages = [];

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    final listImagesGallery = listImages.add(image);

    notifyListeners();
  }

  ///Метод,который выбирает изображение из камеры.
  Future pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    final listImagesCamera = listImages.add(image);
    notifyListeners();
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext aaa) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                  onTap: () {
                    pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add_a_photo_outlined),
                  title: const Text('Camera'),
                  onTap: () {
                    pickImageFromCamera();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }
}
