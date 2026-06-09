part of 'login_bloc.dart';


sealed class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginUserPassEvent extends LoginEvent {

}

class LoginGoogleEvent extends LoginEvent {
}

class LoginAppleEvent extends LoginEvent {
}