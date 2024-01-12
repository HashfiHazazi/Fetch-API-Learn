import 'dart:convert';

import 'package:fetch_api_learn/model/quran_mode.dart';
import 'package:http/http.dart' as http;

class QuranService {
  static const String baseUrl = 'https://quran-api.santrikoding.com';

  static Future<List<Quran>> fetchQuran() async {
    try {
      final quranResponse = await http.get(Uri.parse('$baseUrl/api/surah'));
      final quranBody = quranResponse.body;
      final quranResult = jsonDecode(quranBody);
      List<Quran> quranList =
          List.from(quranResult.map((quran) => Quran.fromJson(quran)));
      return quranList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
