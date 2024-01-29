import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import 'package:newecommerce/src/features/authentication/controllers/signup_controller.dart';
import 'package:newecommerce/src/features/authentication/models/users_model.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../repository/authentication_repostiory/authentication_repostiory.dart';
import '../../../../utils/my_string.dart';


class SignUpFormWidgets extends StatelessWidget {
   SignUpFormWidgets({
    super.key,
  });

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthenticationRepository controller = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight-10),
    child: Form(
    key: formKey,
    child: Column(
    children: [
    TextFormField(
    controller: nameController,
    keyboardType: TextInputType.text,
    validator: (value){
    if(value.toString().length <= 2 || !RegExp(validationName).hasMatch(value!)){
    return "Enter Valid Name";
    }else{
    return null;
    }
    },
    decoration: const InputDecoration(
      border: const OutlineInputBorder(),
      label: Text("Full Name"),
    prefixIcon: Icon(Icons.person_outline_rounded),
    ),
    ),
    const SizedBox(height: tFormHeight-20,),
    TextFormField(
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    validator: (value){
    if(!RegExp(validationEmail).hasMatch(value!)){
    return "Invalid Email";
    }else{
    return null;
    }
    },
    decoration: const InputDecoration(
      border: const OutlineInputBorder(),

      label: Text("E-Mail"),
    prefixIcon: Icon(Icons.email_outlined),
    ),
    ),
    const SizedBox(height: tFormHeight-20,),
    GetBuilder<AuthenticationRepository>(
    builder:(_){
    return TextFormField(
    controller: passwordController,
    keyboardType: TextInputType.visiblePassword,
    validator: (value){
    if(value.toString().length<= 6){
    return " Password Should be Longer Than 6";
    }else{
    return null;
    }
    },
    decoration: const InputDecoration(
    label: Text("Password"),
      border: const OutlineInputBorder(),

      prefixIcon: Icon(Icons.fingerprint_outlined),
    ),
    );
    },
    ),
    const SizedBox(height: tFormHeight-10,),
    // CheckWidget(),
    GetBuilder<AuthenticationRepository>(
    builder: (_){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
      child:const Text('SIGN UP') ,
      onPressed:()  {
      if(formKey.currentState!.validate()){
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text;
      controller.signUpUsingFireBase(
      name: name,
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











    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: tFormHeight-10),
    //   child: Form(
    //     key: _formKey,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         TextFormField(
    //           controller: controller.fullName,
    //           decoration: InputDecoration(
    //             label: Text("Full Name"),
    //             prefixIcon: Icon(Icons.person_outline_rounded),
    //           ),
    //         ),
    //         SizedBox(height: tFormHeight-20,),
    //
    //         TextFormField(
    //           controller: controller.email,
    //           decoration: InputDecoration(
    //             label: Text("E-Mail"),
    //             prefixIcon: Icon(Icons.email_outlined),
    //           ),
    //         ),
    //         SizedBox(height: tFormHeight-20,),
    //
    //         TextFormField(
    //           controller: controller.phoneNo,
    //           decoration: InputDecoration(
    //             label: Text("Phone No"),
    //             prefixIcon: Icon(Icons.contact_mail_outlined),
    //           ),
    //         ),
    //         SizedBox(height: tFormHeight-20,),
    //         TextFormField(
    //           controller: controller.password,
    //           decoration: InputDecoration(
    //             label: Text("Password"),
    //             prefixIcon: Icon(Icons.fingerprint_outlined),
    //           ),
    //         ),
    //
    //         SizedBox(height: tFormHeight-10,),
    //
    //         SizedBox(
    //           width: double.infinity,
    //           child: ElevatedButton(
    //             onPressed: (){
    //               if(_formKey.currentState!.validate()){
    //                 // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
    //                 // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
    //                 // Get.to(()=> Dashboard());
    //                 final user = UserModel(
    //                     fullName: controller.fullName.text.trim(),
    //                     email: controller.email.text.trim(),
    //                     phoneNo: controller.phoneNo.text.trim(),
    //                     password: controller.password.text.trim(),
    //                 );
    //                 SignUpController.instance.createUser(user);
    //               }
    //             },
    //             child: Text("SIGN UP"),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
