import 'package:flutter/cupertino.dart';
import 'package:mvvm_pattern/models/article.dart';
import 'package:mvvm_pattern/services/news_services.dart';

class NewsArticlesViewModel extends ChangeNotifier{
  List<Article> _articles =[];

  List<Article> get articles => _articles;

  Future<void> fetchArticles () async {
    _articles = await NewsApi().fetchArticles();
    notifyListeners();
  }
}