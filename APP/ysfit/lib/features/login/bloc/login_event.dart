// Evento --> bloc -->estado
// 1º en crear

part of 'login_bloc.dart'; // es una parte del bloc

sealed class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
  // El padre del cual heredan los acciones posibles
}

// cualquier cosas que pase o que vaya a pasar el evento Avisa!

// Avisa al bloc: "el email ahora es esto"
class EmailChangedEvent extends LoginEvent {
  EmailChangedEvent(this.email);
  final String email;

  @override
  List<Object?> get props => [email];
}

// Avisa al bloc: "el password ahora es esto"
class PasswordChangedEvent extends LoginEvent {
  PasswordChangedEvent(this.password);
  final String password;

  @override
  List<Object?> get props => [password];
}

// BOTONES
// Al pulsar el botón:
class LoginUserContinueEvent extends LoginEvent {}

class LoginGoogleEvent extends LoginEvent {}

class LoginAppleEvent extends LoginEvent {}
