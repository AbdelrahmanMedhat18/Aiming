import 'package:flutter/material.dart';
import 'package:newecommerce/src/constants/colors.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import 'package:newecommerce/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:newecommerce/src/features/core/screens/dashboard/widgets/categories.dart';

import 'widgets/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {

    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashAppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hey, Coding With Aiming",style: txtTheme.bodyMedium,),
              Text("Explore Courses", style: txtTheme.displayMedium,),
              const SizedBox(height: tDashboardPadding,),
              Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(width: 4),),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Search", style: txtTheme.displayMedium?.apply(color: Colors.grey.withOpacity(0.5),),),
                    const Icon(Icons.mic, size: 25,),
                  ],
                ),
              ),

              const SizedBox(height: tDashboardPadding,),

              DashboardCategories(txtTheme: txtTheme),


              const SizedBox(height: tDashboardPadding,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: tCardBgColor),
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Flexible(child: Image(image: AssetImage(""),)),
                              // Flexible(child: Image(image: AssetImage(""),)),
                              Flexible(child: Icon(Icons.bookmark)),
                              Flexible(child: Icon(Icons.book,size: 70,)),

                            ],
                          ),
                          const SizedBox(height: 25,),
                          Text("Android For Beginners",style: txtTheme.headlineMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                          Text("10 Leasons",style: txtTheme.bodyMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: tDashboardPadding,),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: tCardBgColor),
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Flexible(child: Image(image: AssetImage(""),)),
                                  // Flexible(child: Image(image: AssetImage(""),)),
                                  Flexible(child: Icon(Icons.bookmark,)),
                                  Flexible(child: Icon(Icons.book,size: 50,)),

                                ],
                              ),
                              const SizedBox(height: 25,),
                              Text("Android For Beginners",style: txtTheme.headlineMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                              Text("10 Leasons",style: txtTheme.bodyMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                              onPressed: (){},
                              child: const Text(
                                "View All",
                              ),
                          ),
                        ),
                      ],

                    ),
                  ),
                ],
              ),

              const SizedBox(height: tDashboardPadding,),

              Text("Top Courses",style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2),),
              TopCoursesWidget(txtTheme: txtTheme),
            ],
          ),
        ),
      ),
    );
  }
}



