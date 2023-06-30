import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

import '../../shared/style/component/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function callBack;

  CategoriesScreen(this.callBack);

  List<CategoryModel> categories = [
    CategoryModel(
        categoryId: 'sports',
        title: 'Sports',
        imagePath: 'sports.png',
        backgroundColor: Color(0xffC91C22)),
    CategoryModel(
        categoryId: 'general',
        title: 'Politics',
        imagePath: 'Politics.png',
        backgroundColor: Color(0xff003E90)),
    CategoryModel(
        categoryId: 'health',
        title: 'Health',
        imagePath: 'health.png',
        backgroundColor: Color(0xffED1E79)),
    CategoryModel(
        categoryId: 'business',
        title: 'Business',
        imagePath: 'business.png',
        backgroundColor: Color(0xffCF7E48)),
    CategoryModel(
        categoryId: 'entertainment',
        title: 'Environment',
        imagePath: 'environment.png',
        backgroundColor: Color(0xff4882CF)),
    CategoryModel(
        categoryId: 'science',
        title: 'Science',
        imagePath: 'science.png',
        backgroundColor: Color(0xffF2D352)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category of interested',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    callBack(categories[index]);
                  },
                  child: CategoryItem(
                    category: categories[index],
                    index: index,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
