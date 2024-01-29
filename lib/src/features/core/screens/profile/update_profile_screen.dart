import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newecommerce/src/constants/colors.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import 'package:newecommerce/src/constants/text_strings.dart';
import 'package:newecommerce/src/features/authentication/models/users_model.dart';
import 'package:newecommerce/src/features/core/controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfile,style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context , snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  UserModel user = snapshot.data as UserModel;

                  final email = TextEditingController(text: user.email);
                  final password = TextEditingController(text: user.password);
                  final fullName = TextEditingController(text: user.fullName);
                  final phoneNo = TextEditingController(text: user.phoneNo);

                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Image(image: AssetImage("assets/images/splash-screen.png"))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,

                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: tPrimaryColor,
                              ),
                              child: const Icon(LineAwesomeIcons.camera, color: Colors.black,size: 20,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50,),
                      Form(

                        child: Column(
                          children: [
                            TextFormField(
                              controller: fullName,
                              decoration: const InputDecoration(
                                label: Text("Full Name"),
                                prefixIcon: Icon(Icons.person_outline_rounded),
                              ),
                            ),
                            const SizedBox(height: tFormHeight-20,),

                            TextFormField(
                              controller: email,
                              decoration: const InputDecoration(
                                label: Text("E-Mail"),
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                            ),
                            const SizedBox(height: tFormHeight-20,),

                            TextFormField(
                              controller: phoneNo,
                              decoration: const InputDecoration(
                                label: Text("Phone No"),
                                prefixIcon: Icon(Icons.contact_mail_outlined),
                              ),
                            ),
                            const SizedBox(height: tFormHeight-20,),
                            TextFormField(
                              controller: password,
                              decoration: const InputDecoration(
                                label: Text("Password"),
                                prefixIcon: Icon(Icons.fingerprint_outlined),
                              ),
                            ),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () async{
                                    final userData = UserModel(
                                        fullName: controller.fullName.text.trim(),
                                        email: controller.email.text.trim(),
                                        phoneNo: controller.phoneNo.text.trim(),
                                        password: controller.password.text.trim(),
                                    );
                                    await controller.updateRecord(user);

                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: tPrimaryColor, side: BorderSide.none , shape: const StadiumBorder(),
                                  ),
                                  child: const Text(tEditProfile,style: TextStyle(color: tDarkColor),)
                              ),
                            ),
                            const SizedBox(height: tFormHeight,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: tJoined,
                                    style: TextStyle(fontSize: 12),
                                    children:[
                                      TextSpan(text: tJoined,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent.withOpacity(0.1),
                                      elevation: 0,
                                      foregroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                      side: BorderSide.none
                                  ),
                                  child: const Text("Delete"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }else if (snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }else{
                  return const Center(child: Text("Something went wrong"),);
                }
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      ),
    );
  }
}
