import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysfit/features/login/bloc/login_bloc.dart';
import 'package:ysfit/features/login/view/widgets/login_google.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
          builder: (context, state) => AppLoginWindows(state),
          listener: _runningListener,
          buildWhen: (previousState, currentState) => currentState is! LoginCompletedState,
          listenWhen: (previousState, currentState) => currentState is LoginCompletedState),

      backgroundColor: Color.fromARGB(202, 242, 247, 240),
    );
  }

  void _runningListener(BuildContext context, LoginState state) {
      if(state is LoginCompletedState) {
        //Navigator.of(context).push();
      }
  }
}

class AppLoginWindows extends StatelessWidget {
  AppLoginWindows(this.state);

  final LoginState state;

  @override
  Widget build(BuildContext context) {
    // Envuelvo todo en SingleChildScrollView para que no se salga
    return Stack(children: [
      Positioned.fill(child: LoginContent(state)),
    ]);
  }

}

class LoginContent extends StatelessWidget {
  LoginContent(this.state);

  final LoginState state;

  @override
  Widget build(BuildContext context)
    => SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40),
          SoccerIcon(),

          SizedBox(height: 40),
          FirstText(),
          SecondText(),

          SizedBox(height: 10),
          ThirdText(),

          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            child: EnterEmail(),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 22),
            child: EnterPassword(),
          ),

          if(state is LoginLoadingState)
            const CircularProgressIndicator(),

          if(state is LoginErrorState)
            ErrorText(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: EnterButton(),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            child: DividingLine(),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Google(),
                ),
                SizedBox(width: 16),
                // Botón de Apple
                Expanded(
                  child: Apple(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}

class ErrorText extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => Text('Error');
}

class Apple extends StatelessWidget {
  const Apple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.apple, size: 24),
      label: const Text('Apple'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}



class DividingLine extends StatelessWidget {
  const DividingLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color.fromARGB(236, 38, 85, 32),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'O continúa con',
            style: TextStyle(
              color: Color.fromARGB(236, 38, 85, 32),
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color.fromARGB(236, 38, 85, 32),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

class EnterButton extends StatelessWidget {
  const EnterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(236, 38, 85, 32),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),

        ),
      ),
      /*
      onPressed: state is LoginCompletedState
        ? () => Navigator.of(context).push(MainPage())
        : null,
       */
      onPressed: null,
      child: const Text(
        'Empieza el desafio',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class EnterPassword extends StatelessWidget {
  const EnterPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        prefixIcon: Icon(Icons.lock_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class EnterEmail extends StatelessWidget {
  const EnterEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Tu correo electronico',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class ThirdText extends StatelessWidget {
  const ThirdText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '''
   Frase
bombaaa''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        color: Color.fromARGB(236, 38, 85, 32),
      ),
    );
  }
}

class SecondText extends StatelessWidget {
  const SecondText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Bienvenido a YSFIT',
      style: TextStyle(
        fontSize: 40,
        color: Color.fromARGB(236, 38, 85, 32),
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono', // PReguntar
      ),
    );
  }
}

class FirstText extends StatelessWidget {
  const FirstText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'FRASE MOTIVACIONAL',
      style: TextStyle(
        fontSize: 16,
        letterSpacing: 4,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class SoccerIcon extends StatelessWidget {
  const SoccerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.sports_soccer,
      size: 90,
      color: Color.fromARGB(209, 30, 62, 41),
    );
  }
}
