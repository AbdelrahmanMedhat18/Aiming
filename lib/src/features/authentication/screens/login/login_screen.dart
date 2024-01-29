import 'package:flutter/material.dart';
import 'package:newecommerce/src/constants/sizes.dart';

import 'login_footer.dart';
import 'login_form_field.dart';
import 'login_heade.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeaderWidget(size: size),
                LoginForm(),
                const LoginFooterWidget(),
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}




