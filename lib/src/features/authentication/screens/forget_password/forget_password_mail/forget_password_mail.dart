import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/common_widgets/form/form_header_widget.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import '../../../../../repository/authentication_repostiory/authentication_repostiory.dart';
import '../../../../../utils/my_string.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
   ForgetPasswordMailScreen({super.key});

  final formKey = GlobalKey<FormState>();
   final TextEditingController emailController = TextEditingController();
   final controller = Get.put(AuthenticationRepository());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: 100,),
                const FormHeaderWidgett(
                    image: "assets/images/forgetpass.png",
                    title: "Forget Password",
                    subTitle: "Write Your Email to Reset Password",
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight,),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(!RegExp(validationEmail).hasMatch(value!)){
                            return "Invalid Email";
                          }else{
                            return null;
                          }
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text("E-Mail"),
                          hintText: "E-Mail",
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                            onPressed: (){
                              if(formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                controller.resetPassword(email);
                              }
                            },
                            child: const Text("Next"),
                        ),
                      ),
                    ],
          
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
