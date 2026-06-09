mixin LoginService {

  Future<bool> doSignIn(String user, String password) {
    return Future.value(true);
  }

  Future<bool> doSignUp(String user, String password) {
    return Future.value(true);
  }
}

///
class LoginServiceDevelopment with LoginService {

}

class LoginServiceProduction implements LoginService {

  ///Hola sergio con este metodo tienes que pasarle el [user] y el [password] para que funcione. Un saludo
  @override
  Future<bool> doSignIn(String user, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  @override
  Future<bool> doSignUp(String user, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}