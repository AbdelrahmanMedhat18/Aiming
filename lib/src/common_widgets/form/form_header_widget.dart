import 'package:flutter/material.dart';

class FormHeaderWidgett extends StatelessWidget {
  const FormHeaderWidgett({super.key, required this.image, required this.title, required this.subTitle, this.crossAxisAlignment= CrossAxisAlignment.start, this.heightBetween, this.textAlign});

  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final double? heightBetween;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      // crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          // height: size.height *0.5,
          width: size.width *0.5,
        ),
        // SizedBox(height: 5,),
        Text(title, style: Theme.of(context).textTheme.displayLarge,),
        Text(subTitle,textAlign: textAlign,style: Theme.of(context).textTheme.bodyLarge,),

      ],
    );
  }
}
