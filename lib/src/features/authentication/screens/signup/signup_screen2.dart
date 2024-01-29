import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/features/authentication/screens/login/login_screen.dart';
import 'package:newecommerce/src/features/authentication/screens/signup/signup_form_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/sizes.dart';
import '../../../../repository/authentication_repostiory/authentication_repostiory.dart';
import '../../../../utils/my_string.dart';



class SignUpScreen2 extends StatelessWidget {
  SignUpScreen2({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthenticationRepository controller = Get.put(AuthenticationRepository());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          FormHeaderWidgett(
                    image: "assets/images/splash-screen.png",
                    title: "Sign Up",
                    subTitle: "Learn More..",
                ),
                SignUpFormWidgets(),

                Column(
                  children: [
                    const Text("OR"),
                    const SizedBox(height: tFormHeight-10,),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: (){},
                        icon: const Image(image: AssetImage("assets/images/google.png"),width: 20,),
                        label: const Text("Sign-In With Google"),
                      ),
                    ),
                    const SizedBox(height: tFormHeight -10,),
                    TextButton(
                      onPressed: ()=> Get.to(()=>const LoginScreen()),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: "Already Have An Account?",style: Theme.of(context).textTheme.bodyLarge),
                            TextSpan(text: "LOGIN".toUpperCase() ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
