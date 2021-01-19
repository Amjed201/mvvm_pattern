import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_pattern/models/article.dart';
import 'package:mvvm_pattern/models/articles.dart';

class NewsApi {
  final String API_KEY = '6b7631e82af94e9abe9463f14e23d8f1';

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY');
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final articles = Articles.fromJson(jsonData);
        final articlesList = articles.articles
            .map((article) => Article.fromJson(article))
            .toList();
        return articlesList;
      } else {
        print('status code is ${response.statusCode}');
      }
    } catch (error) {
      print('error occurred : $error');
    }
  }
}
