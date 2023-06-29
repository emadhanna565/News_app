import 'package:flutter/material.dart';
import 'package:news_app/api/model/articles.dart';

class ArticleDetails extends StatefulWidget {
  static const String routeName = 'articleDetails';

  const ArticleDetails({Key? key}) : super(key: key);

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      child: Text(''),
    );
  }
}
