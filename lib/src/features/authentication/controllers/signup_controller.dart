// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:newecommerce/src/features/authentication/models/users_model.dart';
// import 'package:newecommerce/src/repository/authentication_repostiory/authentication_repostiory.dart';
// import 'package:newecommerce/src/repository/user_repostory/user_repoistory.dart';
//
// import '../screens/forget_password/forget_password_otp/otp_screen.dart';
//
// class SignUpController extends GetxController{
//
//   static SignUpController get instance => Get.find();
//
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final fullName = TextEditingController();
//   final phoneNo = TextEditingController();
//
//   final userRepo = Get.put(UserRepository());
//
//   void registerUser(String email , String password){
//     String? error = AuthenticationRepository.instance.creatUserWithEmailAndPassword(email, password) as String?;
//     if(error != null){
//       Get.showSnackbar(GetSnackBar(message: error.toString(),));
//     }
//     AuthenticationRepository.instance.creatUserWithEmailAndPassword(email, password);
//   }
//
//   Future<void> createUser(UserModel user) async {
//
//     await userRepo.createUser(user);
//     phoneAuthentication(user.phoneNo);
//     Get.to(()=>OTPScreen());
//
//   }
//
//   void phoneAuthentication(String phoneNo){
//
//     AuthenticationRepository.instance.phoneAuthentication(phoneNo);
//   }
//
// }