import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysfit/features/login/bloc/login_bloc.dart';
import 'package:ysfit/features/login/view/login_view.dart';
import 'package:ysfit/services/login_service.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => BlocProvider(
        create: (_) => LoginBloc(loginService: context.read<LoginService>()),
        child: LoginView());

}