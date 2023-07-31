import 'package:flutter/material.dart';
import 'package:my_records/screens/auth_screen/auth_screen_model.dart';
import 'package:provider/provider.dart';

class AuthScreenBody extends StatefulWidget {
  const AuthScreenBody({Key? key}) : super(key: key);

  @override
  State<AuthScreenBody> createState() => _AuthScreenBodyState();
}

class _AuthScreenBodyState extends State<AuthScreenBody> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthScreenModel(),
      child: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<AuthScreenModel>();
    final error = context.select((AuthScreenModel value) => value.error);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Добро пожаловать'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_forward_rounded),
          onPressed: () => _model.auth(context)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _model.textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: error.isNotEmpty,
            child: Text(
              error,
              style: const TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
