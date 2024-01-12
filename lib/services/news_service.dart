import 'dart:convert';

import 'package:fetch_api_learn/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static const String baseUrl =
      'https://newsapi.org/v2/everything?q=apple&from=2024-01-09&to=2024-01-09&sortBy=popularity&apiKey=8c18b4fbdb434a288d45906ff30fe80e';

  static Future<List<News>> fetchNews() async {
    try {
      final newsResponse = await http.get(Uri.parse('$baseUrl'));
      final newsBody = newsResponse.body;
      final newsResult = jsonDecode(newsBody);
      List<News> newsList =
          List.from(newsResult['articles'].map((news) => News.fromJson(news)));
      return newsList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
