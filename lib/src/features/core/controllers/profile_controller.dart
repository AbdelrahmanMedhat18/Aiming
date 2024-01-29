import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/features/authentication/models/users_model.dart';
import 'package:newecommerce/src/repository/authentication_repostiory/authentication_repostiory.dart';
import 'package:newecommerce/src/repository/user_repostory/user_repoistory.dart';

class ProfileController extends GetxController{

  static ProfileController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();


  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null){
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<UserModel>>getAllUsers() async => await _userRepo.allUser();

  updateRecord(UserModel user) async{
    await _userRepo.updateUserRecord(user);
  }
}