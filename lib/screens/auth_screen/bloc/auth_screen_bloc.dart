import 'package:bloc/bloc.dart';

import 'auth_screen_event.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, String> {
  AuthScreenBloc() : super('') {
    ///обработчик для моей функции. Что я тут написала. On - это функции которые реагируют на eventы, она принимает в себя кол бэком
    ///функию, которая имеет доступ к эвентам и к emit-который позволит нам изменить наше состояние.
    on<Trening>(_trening);
  }

  _trening(Trening, Emitter<String> emit) {
    emit(state + 'введите пароль');
  }

  /// я написала функцию. Для того, что бы нам изменить наше состояние нам нужно вызвать функцию emit и передать сбда новое состояние.
}
