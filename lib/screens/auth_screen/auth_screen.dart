import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_records/screens/auth_screen/bloc/auth_screen_event.dart';

import 'auth_screen_model.dart';
import 'bloc/auth_screen_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _model = AuthScreenModel();
  @override
  Widget build(BuildContext context) {
    return AuthScreenModelProvider(
      model: _model,
      child: const AuthScreenBody(),
    );
  }
}

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthScreenBloc(),
      child: BlocBuilder<AuthScreenBloc, String>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text('Добро пожаловать'),
            ),
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.arrow_forward_rounded),
                onPressed: () => BlocProvider.of<AuthScreenBloc>(context).add(
                      Trening(),
                    )),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: AuthScreenModelProvider.watch(context)
                          ?.model
                          .authController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                Text(
                  state,
                  style: const TextStyle(fontSize: 50),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
