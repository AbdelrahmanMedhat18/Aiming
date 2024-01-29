import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newecommerce/src/features/authentication/screens/login/login_screen.dart';
import 'package:newecommerce/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:newecommerce/src/features/core/screens/dashboard/dashboard.dart';
import 'package:newecommerce/src/repository/authentication_repostiory/exception/signup_email_failuer.dart';

import '../../features/authentication/screens/login/login_screen2.dart';

class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  var displayUserName = ''.obs;
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();
  bool isVisibility = false;

  // GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  //
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();



  void visibility() {
    isVisibility = !isVisibility;
    update();
  }
  @override
  void onReady(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // FlutterNativeSplash.remove();
    _setInitialScreen(firebaseUser.value);
    // ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null? Get.offAll(()=> const WelcomeScreen()): Get.offAll(()=>const Dashboard());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      verificationFailed: (e){
        if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'The Provided Phone Number is Not Valid.');
        }else{
          Get.snackbar('Error', 'Something Went Wrong. Try Again');

        }
      },
      phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId , resendToken){
        this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value = verificationId;
        },
    );
  }

  Future<bool>verifyOTP(String otp) async{
    
   var credentials = await _auth
        .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));

   return credentials.user != null ? true : false;
  }

  Future<void> creatUserWithEmailAndPassword(String email , String password) async {

    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value !=null ? Get.offAll(()=> const Dashboard()):Get.to(()=>const WelcomeScreen());
    }on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }catch (_){
    }
  }


  Future<void> loginUserWithEmailAndPassword(String email , String password) async {

    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value !=null ? Get.offAll(()=> const Dashboard()):Get.to(()=>const LoginScreen());
      // update();
    }on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }catch (_){}
  }



  Future<void>logout()async{

    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const WelcomeScreen());
    }on FirebaseAuthException catch (e){
      throw e.message!;
    }
  }


  Future<UserCredential?> signInWithGoogle() async{

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);

  }


  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message = 'Account does not exists for that $email.. Create account';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.black,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.black,
      );
    }
  }


  Future<void> signUpUsingFireBase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email, password: password,).then((value) {
        displayUserName.value = name;
        _auth.currentUser!.updateDisplayName(name);
      });
      update();

      firebaseUser.value !=null ? Get.offAll(()=> const Dashboard()):Get.to(()=>const WelcomeScreen());
    } on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.black,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.black,
      );
    }
  }


  Future<void> logInUsingFireBase({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email, password: password,).then((value) {
        _auth.currentUser!.displayName;

      });
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      firebaseUser.value !=null ? Get.offAll(()=> const Dashboard()):Get.to(()=> LoginScreen2());
    } on FirebaseAuthException catch (error) {
      String title = error.code
          .replaceAll(RegExp('-'), ' ')
          .capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message = 'Account does not exists for that $email.. Create account';
      } else if (error.code == 'wrong-password') {
        message = 'Invalid Password... Please try again!';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.black,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.black,
      );
    }
  }


}