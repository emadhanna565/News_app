import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/image_article.png'),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            height: 15,
          ),

          //Source Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'BBC News',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Why are football's biggest clubs starting a new tournament?",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '3 hours',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
