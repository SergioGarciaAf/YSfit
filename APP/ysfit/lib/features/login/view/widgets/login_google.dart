import 'package:flutter/material.dart';
import 'package:ysfit/features/login/view/styles/styles.dart';

class Google extends StatelessWidget {
  const Google({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppColors.black,
          side: const BorderSide(color: AppColors.orange),
          padding: EdgeInsets.zero,
        ),
        child: const Icon(
          Icons.g_mobiledata,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Apple extends StatelessWidget {
  const Apple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppColors.black,
          side: const BorderSide(color: AppColors.orange),
          padding: EdgeInsets.zero,
        ),
        child: const Icon(
          Icons.apple,
          size: 26,
          color: Colors.white,
        ),
      ),
    );
  }
}
