import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenFotoModel extends ChangeNotifier {
  ///Метод,который выбирает изображение из галлереи.

  File? selectedImgae;
  ImagePicker image = ImagePicker();

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    selectedImgae = File(returnedImage.path);
    notifyListeners();
  }

  ///Метод,который выбирает изображение из камеры.
  Future pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    selectedImgae = File(returnedImage.path);
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

  ///Блок по отображению фото с камера или с галлерии

  List<MyImages> myImages = [
    MyImages(
      Image.asset('assets/images/photo1.jpg'),
    ),
    MyImages(
      Image.asset('assets/images/photo2.jpeg'),
    ),
    MyImages(
      Image.asset('assets/images/photo3.jpeg'),
    ),
  ];
}

class MyImages {
  final Image myPhoto;

  MyImages(this.myPhoto);
}
