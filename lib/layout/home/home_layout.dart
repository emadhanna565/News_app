// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/screens/articles/articles_screen.dart';
import 'package:news_app/screens/categories_screen/categories_screen.dart';
import 'package:news_app/screens/settings/settings_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  CategoryModel? selectedCategory;
  bool selectedSetting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/scaffold_background_image.png'),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
          drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: [
                SafeArea(child: SizedBox()),
                Container(
                  height: 120,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    'News App',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    selectedCategory = null;
                    selectedSetting = false;
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.list, size: 35),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Categories',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectedSetting = true;
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.settings, size: 35),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Settings',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(selectedCategory == null
                ? selectedSetting
                    ? 'Settings'
                    : 'News App'
                : selectedCategory!.title),
            actions: selectedCategory == null
                ? null
                : [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_rounded,
                        size: 35,
                      ),
                    ),
                  ],
          ),
          body: selectedCategory == null
              ? selectedSetting
                  ? SettingsScreen()
                  : CategoriesScreen(SelectedCategory)
              : ArticlesScreen() // SettingsScreen() ,

          ),
    );
  }

  SelectedCategory(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    setState(() {});
  }
}
