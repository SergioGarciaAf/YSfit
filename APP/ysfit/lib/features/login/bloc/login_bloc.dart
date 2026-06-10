// Recibe eventos y emite estados IMPORTANTE

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ysfit/services/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

// Recibe el evento hece el trabajo llama al (servicio) y va sacando estados con emit

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // entran evento del tipo LoginEvent y salen del tipo LoginState
  LoginBloc({
    required LoginService
    loginService, //el bloc nesecita que le pasemos el servicio
  }) : _loginService =
           loginService, // guarda el servicio en una variable interna para usarla privada
       super(const LoginInitialState()) {
    // pantalla con el que inicaliza
    on<EmailChangedEvent>(
      _loginUserPassRequested,
    ); //cundo llegue estos eventos ejecuta lo siguiente Funcion que estan debajo
    on<LoginGoogleEvent>(_loginGoogleRequested);
    on<LoginAppleEvent>(_loginAppleRequested);
  }

  final LoginService _loginService; // donde guarda lo que recibe

  // funcion que atiende el el evento x  cada cosa atiende eventos es decir SOLO EVENTOS
  FutureOr<void> _loginUserPassRequested(
    EmailChangedEvent event, // event es el nombre del evento
    Emitter<LoginState> emit,
  ) async {
    // la funcion recibe un evento y la forma de un estado (Emitter<clasepadredeestados> emit)
    emit(LoginLoadingState()); // emitimos un estado

    final ok = await _loginService.doSignIn(
      //le paso cosas al servicio
      event.email
    ); // espera a que pase esto que es de los servicios

    if (ok) {
      // el servicio devolvia True o False
      emit(LoginCompletedState()); // si era True
    } else {
      emit(LoginErrorState()); // si era False
    }
  }

  FutureOr<void> _loginGoogleRequested(
    LoginGoogleEvent event,
    Emitter<LoginState> emit,
  ) {
    print('Login google');
    emit(LoginLoadingState());
  }

  FutureOr<void> _loginAppleRequested(
    LoginAppleEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginErrorState());
    print('Login apple');
  }
}
