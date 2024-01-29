import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';



class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ), backgroundColor: mainColor,
        minimumSize: const Size(360, 50),
      ),
        onPressed: onPressed,
        child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        ),

    );
  }
}
