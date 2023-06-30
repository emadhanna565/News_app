import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/model/NewsResponse.dart';
import 'package:news_app/api/model/SourcesResponse.dart';

class ApiManager {
  static const String apiKey = 'fa21961a8b524a3187ac86ab14cca9b5';
  static const String baseUrl = 'newsapi.org';

  static Future<SourcesResponse> getNewsSources(String categoryId) async {
    var uri = Uri.https(
        baseUrl,
        'v2/top-headlines/sources',
        //parameter
        {
          'apiKey': apiKey,
          'category': categoryId,
        });
    var response = await http.get(uri);
    var jsonString = response.body;
    var sourcesResponse = SourcesResponse.fromJson(jsonDecode(jsonString));
    return sourcesResponse;
  }

  //https://newsapi.org/v2/everything?apiKey=fa21961a8b524a3187ac86ab14cca9b5&sources=bbc-sport
  static Future<NewsResponse> getNews(String sourceId) async {
    var url = Uri.https(baseUrl, 'v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
    });
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
