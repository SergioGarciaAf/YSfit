// 2º en crear

part of 'login_bloc.dart'; // forma parte del bolc

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

// Estado inicial
class LoginInitialState extends LoginState {
  const LoginInitialState();
}

// Estado de error
class LoginErrorState extends LoginState {
  const LoginErrorState({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

//estado cargando
class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

//estado completado
class LoginCompletedState extends LoginState {
  const LoginCompletedState();
}
