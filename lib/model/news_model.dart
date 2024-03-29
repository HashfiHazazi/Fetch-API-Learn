class News {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content});
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        content: json['content']);
  }
}
