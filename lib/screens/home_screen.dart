import 'package:flutter/material.dart';
import 'package:my_records/screens/add_record/add_record_screen.dart';
import 'package:my_records/screens/my_results/my_results.dart';
import 'package:my_records/screens/notes/my_notes.dart';
import 'package:my_records/screens/photo/screen_photo.dart';
import 'package:my_records/screens/trening_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void onTapItem(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children:  const [
        MyResultsBody(),
        AddRecordScreenBody(),
        MyNotesBody(),
        ScreenPhotoBody(),
        TreningScreen(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13,
        iconSize: 30,
        currentIndex: _currentIndex,
        onTap: onTapItem,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new_sharp),
              label: 'Мои Результаты'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              label: 'Добавить'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mark_unread_chat_alt_outlined),
              label: 'Заметки'),
          BottomNavigationBarItem(
              icon: Icon(Icons.videocam_rounded), label: 'Фото'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert), label: 'Тренировка'),
        ],
      ),
    );
  }
}
