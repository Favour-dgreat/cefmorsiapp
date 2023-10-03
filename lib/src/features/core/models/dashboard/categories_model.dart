import 'package:flutter/material.dart';

class DashboardCategoriesModel{
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel("JS", "JavaScript", "10 lessons", null),
    DashboardCategoriesModel("JS", "JavaScript", "10 lessons", null),
    DashboardCategoriesModel("JS", "JavaScript", "10 lessons", null),
    DashboardCategoriesModel("JS", "JavaScript", "10 lessons", null),
    DashboardCategoriesModel("JS", "JavaScript", "10 lessons", null),
  ];
}
