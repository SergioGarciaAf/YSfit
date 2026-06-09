import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysfit/features/login/view/login_page.dart';
import 'package:ysfit/features/login/view/login_view.dart';
import 'package:ysfit/l10n/l10n.dart';
import 'package:ysfit/services/login_service.dart';

class App extends StatelessWidget {
  const App({
    required LoginService loginService
}) :
      _loginService = loginService;

  final LoginService _loginService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _loginService)
        ],
        child: MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: LoginPage(), //home pantalla principal
    ));
  }
}
