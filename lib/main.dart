import 'package:flutter/material.dart';
import 'package:mvvm_pattern/models/article.dart';
import 'package:mvvm_pattern/view%20models/news_articles_viewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsArticlesViewModel(),
      child: MaterialApp(
        title: 'News App',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Provider.of<NewsArticlesViewModel>(context, listen: false).fetchArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsArticlesViewModel>(builder: (context, newsProvider, _) {
      final _articles = newsProvider.articles;
      return Scaffold(
        appBar: AppBar(
          title: Text('World News'),
        ),
        body: ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: Container(
                  child: Image.network(
                    '${_articles[index].urlToImage}',
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(_articles[index].title ?? 'loading'),
                subtitle: Text(_articles[index].description ?? 'loading'),
              ),
            );
          },
        ),
      );
    });
  }
}
