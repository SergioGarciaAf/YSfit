import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ysfit/features/login/bloc/login_bloc.dart';

class Google extends StatelessWidget {
  const Google({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => context.read<LoginBloc>().add(LoginGoogleEvent()),
      icon: const Icon(Icons.g_mobiledata, size: 28),
      label: const Text('Google'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color.fromARGB(221, 0, 0, 0),
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