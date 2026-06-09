import 'package:ysfit/app/app.dart';
import 'package:ysfit/bootstrap.dart';
import 'package:ysfit/services/login_service.dart';

Future<void> main() async {
  await bootstrap(() => App(loginService: LoginServiceProduction()));
}
