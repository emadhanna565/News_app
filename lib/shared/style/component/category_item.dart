import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: index % 2 == 0 ? Radius.zero : Radius.circular(30),
          bottomLeft: index % 2 == 0 ? Radius.circular(30) : Radius.zero,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/${category.imagePath}',
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            '${category.title}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
