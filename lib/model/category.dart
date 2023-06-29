import 'dart:ui';

class CategoryModel {
  String categoryId;
  String imagePath;
  String title;
  Color backgroundColor;

  CategoryModel(
      {required this.categoryId,
      required this.title,
      required this.imagePath,
      required this.backgroundColor});
}
