import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import 'package:newecommerce/src/features/authentication/screens/signup/signup_screen2.dart';
import '../../controllers/login_controller.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight-10,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage("assets/images/google.png"),width: 20,),
            onPressed: (){
              controller.googleSignIn();
              // Get.to()
            },
            label: const Text("Sign-In With Google"),
          ),
        ),
        const SizedBox(height: tFormHeight-20,),
        TextButton(
          onPressed: (){
            // Get.to(SignUpScreen());
            Get.to(()=> SignUpScreen2());

          },
          child: Text.rich(
            TextSpan(
              text: "Don't Have An Account?",style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(text:"Signup".toUpperCase(),style: const TextStyle(color: Colors.blue), ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
