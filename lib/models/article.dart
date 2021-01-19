class Article {
  String title;

  String description;

  String content;

  String urlToImage;

  Article({this.title, this.description, this.content, this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
        title: jsonData['title'],
        description: jsonData['description'],
        content: jsonData['content'],
        urlToImage: jsonData['urlToImage']);
  }
}
