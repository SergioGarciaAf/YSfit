import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysfit/features/login/bloc/login_bloc.dart';
import 'package:ysfit/features/login/view/styles/styles.dart';
import 'package:ysfit/features/login/view/widgets/login_google.dart';

// CAMBIO: paleta centralizada. Tu verde (38, 85, 32) sigue siendo el
// protagonista, pero ahora sobre fondo oscuro como en el diseño de referencia.
// Asi cambias un color en un solo sitio y se actualiza toda la pantalla.

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        //reacciona tanto a eventos como a estados
        builder: (context, state) => LoginContent(
          state,
        ), //redibuja tu pantalla y le pasa el estado actual
        listener: _runningListener, // reacciona al estado que llega del bloc
        buildWhen: (previousState, currentState) =>
            currentState
                is! LoginCompletedState, //redibuja siempre excepto cuando el estado sea x
        listenWhen: (previousState, currentState) =>
            currentState is LoginCompletedState,
      ), // reacciona solo cuando el estado sea x
      // CAMBIO: fondo oscuro en vez del verde clarito
      backgroundColor: AppColors.black,
    );
  }

  // si el estado que llega es que el login esta completado
  void _runningListener(BuildContext context, LoginState state) {
    switch (state) {
      case LoginCompletedState:
        //Navigator.of(context).push();
        break;
      case LoginLoadingState:
        final emailController = TextEditingController();
        final passwordController = TextEditingController();
        context.read<LoginBloc>().add(
          LoginUserContinueEvent(
            email: EnterEmail.text.trim(),
            password: passwordController.text,
          ),
        );
        break;
      default:
    }
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent(this.state, {super.key});

  final LoginState state;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 40),
        const SoccerIcon(),
        const SizedBox(height: 14),
        const FirstText(),
        const SizedBox(height: 9),
        const Subtitle(),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 420,
            ),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: CardStyle.card,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: CardStyle.border,
              ),
            ),
            child: Column(
              children: [
                const SecondText(),
                const SizedBox(height: 6),
                const ThirdText(),
                const SizedBox(height: 28),
                const SizedBox(height: 8),
                const EnterEmail(),
                const SizedBox(height: 20),
                const SizedBox(height: 8),
                const EnterPassword(),
                const SizedBox(height: 24),
                // llega estado cargando ponemos el spiner
                if (state is LoginLoadingState)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: CircularProgressIndicator(
                        color: AppColors.orange,
                      ),
                    ),
                  ),
                // llega el estado error y ponemos Error
                if (state is LoginErrorState)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: ErrorText(),
                  ),
                const SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: EnterButton(),
                ),
                const SizedBox(height: 24),
                const DividingLine(),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Google(),
                    SizedBox(width: 60),
                    Apple(),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 28),

        // CAMBIO: texto de pie nuevo, fuera de la tarjeta
        // ("¿No tienes cuenta? Crea una")
        // const _PieRegistro(),
        const SizedBox(height: 40),
      ],
    ),
  );
}

class Subtitle extends StatelessWidget {
  const Subtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Entrenas como juegas y juegas como entrenas',
      style: TextStyle(color: AppColors.secondColor),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) => const Text(
    'Error',
    style: TextStyle(color: Color(0xFFFF7A7A)),
  );
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
            color: AppColors.secondColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'O continúa con',
            style: TextStyle(
              color: AppColors.secondColor,
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.secondColor,
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.orange,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledForegroundColor: AppColors.white,
        ),
        /*
        onPressed: state is LoginCompletedState
          ? () => Navigator.of(context).push(MainPage())
          : null,
         */
        onPressed: null,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Empieza el desafío',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      ),
    );
  }
}

// cambio entre pinchar o no
class EnterPassword extends StatelessWidget {
  const EnterPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class EnterEmail extends StatelessWidget {
  const EnterEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        hintText: 'escribe@tucorreo.com',
        hintStyle: const TextStyle(color: AppColors.thirdColor),
        prefixIcon: const Icon(
          Icons.email_outlined,
          color: AppColors.thirdColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: EnterEmailStyle.enabledBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppColors.orange,
            width: EnterEmailStyle.focusedBordersize,
          ),
        ),
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
    // CAMBIO: ahora es el subtitulo pequeño bajo el titulo de la tarjeta
    // (como "Sign in to continue"). Ya no va centrado ni multilinea.
    return const Text(
      'Inicia sesión para continuar',
      style: TextStyle(
        fontSize: ThirdTextStyle.fontSize,
        color: AppColors.secondColor,
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
        fontSize: SecondTextStyle.fontSize,
        letterSpacing: 2,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        // fontFamily: 'RobotoMono', FUTURO
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
      'Y S F I T',
      style: TextStyle(
        fontSize: FirstLeterStyle.fontSize,
        letterSpacing: 7,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
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
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.orange,
      ),
      child: const Icon(
        Icons.sports_soccer,
        size: 48,
        color: AppColors.white,
      ),
    );
  }
}
