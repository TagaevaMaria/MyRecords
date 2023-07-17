import 'package:flutter/material.dart';
import 'package:my_records/navigation/main_navigation.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: 'Masha');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Добро пожаловать'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward_rounded),
        onPressed: () =>
            Navigator.pushNamed(context, MainNavigationRoutsName.homeScreen),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Введите ваше имя'),
                maxLines: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
