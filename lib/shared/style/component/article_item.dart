import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/api/model/Source.dart';
import 'package:news_app/api/model/articles.dart';
import 'package:news_app/screens/article_details/article_details.dart';

class ArticleItem extends StatelessWidget {
  Source source;

  ArticleItem({
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    Articles article;
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error Loading State ${snapshot.error.toString()}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text('Server Error ${snapshot.data?.message}'),
            );
          }
          var articles = snapshot.data?.articles;
          return ListView.separated(
            itemCount: articles?.length ?? 0,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ArticleDetails.routeName,
                      arguments: articles[index]);
                },
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: '${articles![index].urlToImage}',
                          imageBuilder: (context, imageProvider) => Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fill),
                            ),
                          ),
                          placeholder: (context, url) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Icon(Icons.error);
                          },
                        ),
                      ),
                      /* Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${articles[index].urlToImage}'),
                              fit: BoxFit.fill,
                            )),
                      ),*/
                      SizedBox(
                        height: 15,
                      ),

                      //Source Title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${articles[index].source?.id}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "${articles[index].title}",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${articles[index].publishedAt}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
