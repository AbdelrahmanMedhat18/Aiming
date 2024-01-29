// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:newecommerce/src/common_widgets/form/form_header_widget.dart';
// import 'package:newecommerce/src/constants/colors.dart';
// import 'package:newecommerce/src/constants/sizes.dart';
// import 'package:newecommerce/src/features/authentication/screens/login/login_footer.dart';
// import 'package:newecommerce/src/features/authentication/screens/login/login_form_field.dart';
// import 'package:newecommerce/src/features/authentication/screens/login/login_heade.dart';
// import 'package:newecommerce/src/features/authentication/screens/login/login_screen.dart';
//
// import 'signup_form_widget.dart';
//
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(tDefaultSize),
//             child:  Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 FormHeaderWidgett(
//                     image: "assets/images/splash-screen.png",
//                     title: "Sign Up",
//                     subTitle: "kkkka MKMKS SKMASMK MKSAMk",
//                 ),
//                 SignUpFormWidgets(),
//
//                 Column(
//                   children: [
//                     Text("OR"),
//                     SizedBox(height: tFormHeight-10,),
//                     SizedBox(
//                       width: double.infinity,
//                       child: OutlinedButton.icon(
//                           onPressed: (){},
//                           icon: Image(image: AssetImage("assets/images/google.png"),width: 20,),
//                           label: Text("Sign-In With Google"),
//                       ),
//                     ),
//                     SizedBox(height: tFormHeight -10,),
//                     TextButton(
//                         onPressed: ()=> Get.to(()=>LoginScreen()),
//                         child: Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(text: "Already Have An Account?",style: Theme.of(context).textTheme.bodyText1),
//                               TextSpan(text: "LOGIN".toUpperCase() ),
//                             ],
//                           ),
//                         ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
