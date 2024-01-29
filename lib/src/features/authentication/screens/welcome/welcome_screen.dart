import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/constants/colors.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import 'package:newecommerce/src/constants/text_strings.dart';
import 'package:newecommerce/src/features/authentication/screens/login/login_screen.dart';
import 'package:newecommerce/src/features/authentication/screens/login/login_screen2.dart';
import 'package:newecommerce/src/features/authentication/screens/signup/signup_screen2.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body:  Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(image: AssetImage("assets/images/splash-screen.png"),),
            Column(
              children: [
                Text(tWelcomeTitle, style: Theme.of(context).textTheme.displaySmall,),
                Text(tWelcomeSubTitle,style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: ()=>Get.to(()=>  LoginScreen2()),
                      child:Text(
                        "Login".toUpperCase(),
                      ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: ()=> Get.to(()=>SignUpScreen2()),
                    child:Text(
                      "SignUp".toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
