import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/screens/articles/articles_screen.dart';

class HomeNewsFragment extends StatelessWidget {
  CategoryModel categoryModel;

  HomeNewsFragment({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNewsSources(categoryModel.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.sources == null) {
            return Center(
              child: Text('No found data'),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.hasError.toString()),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                ],
              ),
            );
          }
          var response = snapshot.data;
          if (response?.status == 'error') {
            return Center(
              child: Column(
                children: [
                  Text(response?.message ?? ""),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                ],
              ),
            );
          }
          return ArticlesScreen(response?.sources);
        });
  }
}
