import 'package:CMI/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

class BooksCategoriesModel{
  final  Image;
  final String title;
  final String author;
  final VoidCallback? onPress;

  BooksCategoriesModel(this.Image,this.title, this.author, this.onPress);

  static List<BooksCategoriesModel> list = [
    BooksCategoriesModel(tBannerImage1, "AFD", "Chukie Morsi", null),
    BooksCategoriesModel(tBannerImage1, "AFD", "Chukie Morsi", null),
    BooksCategoriesModel(tBannerImage1, "AFD", "Chukie Morsi", null),
    BooksCategoriesModel(tBannerImage1, "AFD", "Chukie Morsi", null),
    BooksCategoriesModel(tBannerImage1, "AFD", "Chukie Morsi", null),
  ];
}