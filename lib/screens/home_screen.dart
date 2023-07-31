import 'package:flutter/material.dart';
import 'package:my_records/screens/add_record/add_record_screen.dart';
import 'package:my_records/screens/my_results/my_results.dart';
import 'package:my_records/screens/trening_screen.dart';

import 'my_notes.dart';

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
      body: IndexedStack(index: _currentIndex, children: const [
        MyResultsBody(),
        AddRecordScreenBody(),
        MyNotes(),
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

/*
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
      body: IndexedStack(index: _currentIndex, children: [
        ScreenHomeWidget(),
        ScreenService(),
        ScreenMessengers(),
        ScreenClips(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColors.blue,
        unselectedItemColor: MyColors.grey,
        selectedFontSize: 13,
        iconSize: 30,
        currentIndex: _currentIndex,
        onTap: onTapItem,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Главная'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pattern_sharp,
              ),
              label: 'Сервисы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline), label: 'Мессенджеры'),
          BottomNavigationBarItem(
              icon: Icon(Icons.swipe_up_outlined), label: 'Клипы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: 'Видео'),
        ],
      ),
    );
  }
}

 */
