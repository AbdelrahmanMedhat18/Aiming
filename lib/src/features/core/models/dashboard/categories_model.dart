
import 'dart:ui';

class DashboardCategoriesModel{

  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(this.title, this.heading, this.subHeading, this.onPress);


  static List<DashboardCategoriesModel> list = [

    DashboardCategoriesModel("JS", "Java Script","10 Leasons",null),
    DashboardCategoriesModel("F", "Flutter","11 Leasons",null),
    DashboardCategoriesModel("H", "HTML","8 Leasons",null),
    DashboardCategoriesModel("K", "Kotlin","20 Leasons",null),
    DashboardCategoriesModel("P", "Python","15 Leasons",null),

  ];
}