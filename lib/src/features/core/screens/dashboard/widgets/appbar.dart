import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/constants/colors.dart';
import 'package:newecommerce/src/constants/text_strings.dart';
import 'package:newecommerce/src/features/core/screens/profile/profile_screen.dart';
class DashAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const DashAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu, color: Colors.black,),
      title: Text(tAppName,style: Theme.of(context).textTheme.headlineMedium,),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20,top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: tCardBgColor,
          ),
          child: IconButton(
            onPressed: (){
              Get.to(()=> const ProfileScreen());
              // AuthenticationRepository.instance.logout();
            },
            icon: const Icon(Icons.person_outline_outlined),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
