import 'dart:convert';
import 'package:fetch_api_learn/model/lorem_ipsum_model.dart';
import 'package:http/http.dart' as http;

class LoremIpsumApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<LoremIpsumApi>> fetchLoremIpsumApi() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      final body = response.body;
      final result = jsonDecode(body);
      List<LoremIpsumApi> loremIpsumList = List.from(
          result.map((loremIpsum) => LoremIpsumApi.fromJson(loremIpsum)));
      return loremIpsumList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
