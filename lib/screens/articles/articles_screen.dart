import 'package:flutter/material.dart';
import 'package:news_app/shared/style/component/article_item.dart';
import 'package:news_app/shared/style/component/tab_item.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0;

  List<String> sources = [
    "BBC News",
    "CBC News",
    "ON News",
    "BIEN News",
    "Sky News",
    "Al Jazeera News",
    "Nile News",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: sources
                  .map((source) => TabItem(
                      selected: selectedIndex == sources.indexOf(source),
                      sourceTitle: source))
                  .toList()),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ArticleItem(),
              separatorBuilder: (context, index) => SizedBox(
                height: 15,
              ),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
