import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenFotoModel extends ChangeNotifier {
  ///Метод,который выбирает изображение из галлереи.

  File? selectedImgae;

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
    MyImages(
      Image.asset('assets/images/photo4.jpeg'),
    )
  ];

  /// Получение списка камер.
}

class MyImages {
  final Image myPhoto;

  MyImages(this.myPhoto);
}
