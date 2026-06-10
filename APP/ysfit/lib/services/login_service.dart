// que es el service es el que habla con internet o base de datos
// el bolc le pide por ejemplo

// tiene dos posibilidades singinIn o singnUp y de vuelve true o fase
mixin LoginService {
  Future<bool> doSignIn(String user, String password) {
    // que nesecita el user y la contraseña actual
    return Future.value(true);
  }

  Future<bool> doSignUp(String user, String password) {
    return Future.value(true);
  }
}

// tenemos dos clase que heredan del contrato para que cuando haga pruebas cambie de base datos mas seguro
class LoginServiceDevelopment with LoginService {}

class LoginServiceProduction implements LoginService {
  ///Hola sergio con este metodo tienes que pasarle el [user] y el [password] para que funcione. Un saludo
  @override // sobrescribo el mixin
  Future<bool> doSignIn(String user, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return false; // retorna que es lo que recibe el bloc
  }

  @override
  Future<bool> doSignUp(String user, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }
}
