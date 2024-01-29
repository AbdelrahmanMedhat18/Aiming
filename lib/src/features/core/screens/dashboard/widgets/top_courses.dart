import 'package:flutter/material.dart';
import 'package:newecommerce/src/constants/colors.dart';
import 'package:newecommerce/src/constants/sizes.dart';

import '../../../models/dashboard/categories_model.dart';

class TopCoursesWidget extends StatelessWidget {
  const TopCoursesWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context,index)=>
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10,top: 5),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: tCardBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            list[index].title,
                            style: txtTheme.headlineMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(child: Icon(Icons.book_online_outlined,size: 80,)),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                          child: const Icon(Icons.play_arrow),
                        ),
                        const SizedBox(width: tDashboardCardPadding,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index].subHeading,style: txtTheme.headlineMedium, overflow: TextOverflow.ellipsis,),
                            Text(list[index].heading, style: txtTheme.bodyMedium,overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
