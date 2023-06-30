// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/api/model/articles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  static const String routeName = 'web_view';
  late WebViewController controller;

  WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Articles;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(article.url ?? ''));
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/scaffold_background_image.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(article.title ?? ''),
          ),
          body: WebViewWidget(
            controller: controller,
          )),
    );
  }
}
