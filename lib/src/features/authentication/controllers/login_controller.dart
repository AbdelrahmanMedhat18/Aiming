import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/features/core/screens/dashboard/dashboard.dart';
import 'package:newecommerce/src/repository/authentication_repostiory/authentication_repostiory.dart';

class LogInController extends GetxController{

  static LogInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final isGoogleLoading = false.obs;


 Future<void> loginUser( email ,  password) async{


   String? error = await AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password) as String?;
   if(error != null){
     Get.showSnackbar(GetSnackBar(message: error.toString(),));
   }
 }

 Future<void> googleSignIn()async{

   try{
     isGoogleLoading.value = true;
     await AuthenticationRepository.instance.signInWithGoogle();
     Get.to(()=> const Dashboard());
     isGoogleLoading.value = false;
   }catch(e){
     isGoogleLoading.value = false;
   }
 }



}