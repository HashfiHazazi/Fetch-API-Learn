import 'package:fetch_api_learn/model/news_model.dart';
import 'package:fetch_api_learn/services/news_service.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<News> news = [];

  void fetchNews() async {
    final result = await NewsService.fetchNews();
    news = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'News API fetch',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final newsResult = news[index];
          return Card(
            child: ListTile(
              title: Text('${newsResult.title}'),
              subtitle: Text(
                '${newsResult.description}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              leading: (newsResult.urlToImage  != null) ? Image.network(newsResult.urlToImage) : null,
            ),
          );
        },
        itemCount: news.length,
      ),
    );
  }
}
