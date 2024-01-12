import 'dart:convert';

import 'package:fetch_api_learn/model/model_film.dart';
import 'package:http/http.dart' as http;

class FilmService {
  static const String baseUrl = 'https://www.omdbapi.com';
  static Future<List<Film>> fetchFilm() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/?t=spongebob&apikey=4004518'));
      final body = response.body;
      final result = jsonDecode(body);
      List<Film> filmList =
          List.from(result.map((film) => Film.fromJson(film)));
      return filmList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
