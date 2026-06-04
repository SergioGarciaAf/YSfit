import 'package:ysfit/app/app.dart';
import 'package:ysfit/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
