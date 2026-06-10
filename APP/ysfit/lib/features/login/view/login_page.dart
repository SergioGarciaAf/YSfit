// CUARTA PANTALLA pantalla a la que va
// crea el bloc y lo dejas listo

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysfit/features/login/bloc/login_bloc.dart';
import 'package:ysfit/features/login/view/login_view.dart';
import 'package:ysfit/services/login_service.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    // crea el bloc
    create: (_) => LoginBloc(
      loginService: context.read<LoginService>(),
    ), // le pasa el loggin service que ya pusimos en general con el App
    child: LoginView(),
  ); //lamamos a la vista
}
