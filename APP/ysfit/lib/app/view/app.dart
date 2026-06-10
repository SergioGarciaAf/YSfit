//Segundo es el bootstrap
//TERCER CODIGO QUE SE EJECUTA
// es la pantalla base como el lienzo

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysfit/features/login/view/login_page.dart';
import 'package:ysfit/l10n/l10n.dart';
import 'package:ysfit/services/login_service.dart';

class App extends StatelessWidget {
  const App({
    required LoginService loginService, // recibo el servicio del main
  }) : _loginService = loginService;

  final LoginService _loginService; // guardo el servicio

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // ofrece varios servicios a la ves en una lista disponibles para TODA LA APP
        RepositoryProvider.value(
          value: _loginService,
        ), // ofrece un servicio ya existente el que recogimos arriba
        // usamos .value por que el servicio ya esta creado desde el main sino seria  .create
      ],
      child: MaterialApp(
        // Corazon visible de la app
        theme: ThemeData(
          // aspecto global
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.inversePrimary, // fondo
          ),
          useMaterial3: true, // usa el modelo moderno de google
        ),
        localizationsDelegates: AppLocalizations
            .localizationsDelegates, //traductores que la app tiene disponible
        supportedLocales:
            AppLocalizations.supportedLocales, // lista de idiomas que soporta
        home: LoginPage(), //PRIMERA PAGINA
      ),
    );
  }
}
