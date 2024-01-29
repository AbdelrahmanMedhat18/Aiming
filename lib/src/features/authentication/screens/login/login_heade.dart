import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
     this.size,
  });

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage("assets/images/splash-screen.png"),
          height: size!.height *0.2,
        ),
        Text("Welcome Back,", style: Theme.of(context).textTheme.displayLarge,),
        Text("Learn More..",style: Theme.of(context).textTheme.bodyLarge,),

      ],
    );
  }
}
