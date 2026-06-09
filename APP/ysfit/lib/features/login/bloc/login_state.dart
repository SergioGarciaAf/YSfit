part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {
}

class LoginErrorState extends LoginState {

}

class LoginLoadingState extends LoginState {

}

class LoginCompletedState extends LoginState {

}