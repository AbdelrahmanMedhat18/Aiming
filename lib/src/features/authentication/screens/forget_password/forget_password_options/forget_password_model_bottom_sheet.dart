import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import 'package:newecommerce/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'forget_password_btn_widgets.dart';

class ForgetPasswordScreen {


  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
      builder: (context)=>Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recive Your Password",style: Theme.of(context).textTheme.displayMedium,),
            Text("Recive Your Password",style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 30,),
            ForgetPasswordBtnWidgets(
              onTap: (){
                Navigator.pop(context);
                Get.to(()=> ForgetPasswordMailScreen());
              },
              title: "E-Mail",
              subTitle: "Reset Via Mail Verfication",
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 20,),
            ForgetPasswordBtnWidgets(
              onTap: (){},
              title: "Phone No",
              subTitle: "Reset Via Phone Verfication",
              btnIcon: Icons.mobile_friendly_rounded,
            ),

          ],
        ),
      ),
    );
  }

}