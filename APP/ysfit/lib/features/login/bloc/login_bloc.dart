import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ysfit/services/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginService loginService
}) :
      _loginService = loginService,
        super(LoginInitialState()) {
    on<LoginUserPassEvent>(_loginUserPassRequested);
    on<LoginGoogleEvent>(_loginGoogleRequested);
    on<LoginAppleEvent>(_loginAppleRequested);
  }

  final LoginService _loginService;

  FutureOr<void> _loginUserPassRequested(LoginUserPassEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    final ok = await _loginService.doSignIn('', '');

    if(ok) {
      emit(LoginCompletedState());
    } else {
      emit(LoginErrorState());
    }
  }

  FutureOr<void> _loginGoogleRequested(LoginGoogleEvent event, Emitter<LoginState> emit) {
    print('Login google');
    emit(LoginLoadingState());
  }

  FutureOr<void> _loginAppleRequested(LoginAppleEvent event, Emitter<LoginState> emit) {
    emit(LoginErrorState());
    print('Login apple');
  }
}

