import 'package:flutter/material.dart';
import 'package:news_app/api/model/Source.dart';
import 'package:news_app/shared/style/component/article_item.dart';
import 'package:news_app/shared/style/component/tab_item.dart';

class ArticlesScreen extends StatefulWidget {
  List<Source>? sources;

  ArticlesScreen(this.sources);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources?.length ?? 0,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sources
                      ?.map((source) => TabItem(
                          selected:
                              selectedIndex == widget.sources?.indexOf(source),
                          source: source))
                      .toList() ??
                  []),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: ArticleItem(source: widget.sources![selectedIndex])),
        ],
      ),
    );
  }
}
