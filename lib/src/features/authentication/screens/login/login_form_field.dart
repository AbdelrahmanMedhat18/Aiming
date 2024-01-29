import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import 'package:newecommerce/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import '../../../../repository/authentication_repostiory/authentication_repostiory.dart';
import '../../../../utils/my_string.dart';


class LoginForm extends StatefulWidget {
   const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
   final formKey = GlobalKey<FormState>();

   final TextEditingController emailController = TextEditingController();

   final TextEditingController passwordController = TextEditingController();

   AuthenticationRepository controller = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Container(
            padding: const EdgeInsets.symmetric(vertical: tFormHeight -10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(!RegExp(validationEmail).hasMatch(value!)){
                  return "Invalid Email";
                }else{
                  return null;
                }
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Email",
                hintText: "E-Mail",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20,),
            GetBuilder<AuthenticationRepository>(
              builder:(_){
                return TextFormField(
                  controller: passwordController,
                  obscureText: controller.isVisibility? false:true,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value){
                    if(value.toString().length<= 6){
                      return " Password Should be Longer Than 6";
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Password",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        controller.visibility();
                      },
                      icon: controller.isVisibility
                          ?const Icon(
                          Icons.visibility_off
                      )
                          :const Icon(Icons.visibility,),
                    ),
                  ),
                );
              },
            ),
            Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: (){
                        ForgetPasswordScreen.buildShowModalBottomSheet(context);
                      },
                      child: const Text(
                        "Forget Password?",
                      ),
                    ),
                  ),
            GetBuilder<AuthenticationRepository>(
              builder: (_){
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text ('LOG IN') ,
                    onPressed:(){
                      if(formKey.currentState!.validate()){
                        String email = emailController.text.trim();
                        String password = passwordController.text;
                        controller.logInUsingFireBase(
                          email: email,
                          password: password,
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

















    // return Form(
    //   key: formKey,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: tFormHeight -10),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         TextFormField(
    //           keyboardType: TextInputType.emailAddress,
    //           validator: (value){
    //             if(!RegExp(validationEmail).hasMatch(value!)){
    //               return "Invalid Email";
    //             }else{
    //               return null;
    //             }
    //           },
    //           controller: controller.email,
    //           decoration: const InputDecoration(
    //             prefixIcon: Icon(Icons.person_outline_outlined),
    //             labelText: "Email",
    //             hintText: "E-Mail",
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //         const SizedBox(height: tFormHeight,),
    //         TextFormField(
    //           keyboardType: TextInputType.visiblePassword,
    //           validator: (value){
    //             if(value.toString().length<= 6){
    //               return " Password Should be Longer Than 6";
    //             }else{
    //               return null;
    //             }
    //           },
    //           controller: controller.password,
    //           decoration: InputDecoration(
    //             prefixIcon: const Icon(Icons.fingerprint),
    //             labelText: "Password",
    //             hintText: "Password",
    //             border: const OutlineInputBorder(),
    //             suffixIcon: IconButton(
    //               onPressed: (){},
    //               icon: const Icon(Icons.remove_red_eye_sharp),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: tFormHeight-20,),
    //         Align(
    //           alignment: Alignment.centerRight,
    //           child: TextButton(
    //             onPressed: (){
    //               ForgetPasswordScreen.buildShowModalBottomSheet(context);
    //             },
    //             child: const Text(
    //               "Forget Password?",
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           width: double.infinity,
    //           child: ElevatedButton(
    //             onPressed: (){
    //               if(formKey.currentState!.validate()){
    //
    //                 LogInController.instance.loginUser(controller.email.text.trim(), controller.password.text.trim());
    //
    //               }
    //               // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
    //
    //             },
    //             child: Text("Login".toUpperCase()),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

