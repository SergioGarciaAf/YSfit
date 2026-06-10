// PRIMER CODIGO QUE SE EJECUTA

import 'package:ysfit/app/app.dart';
import 'package:ysfit/bootstrap.dart';
import 'package:ysfit/services/login_service.dart';

Future<void> main() async {
  await bootstrap(
    () => App(
      loginService: LoginServiceDevelopment(),
    ), //creas el servicio y lo pasas
  ); //aqui elijo el servicio que quiero
}
