import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fetch_api_learn/model/quran_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  final baseUrl = 'http://api.alquran.cloud';

  void fetchQuran() async {
    final response = await http.get(Uri.parse('$baseUrl/v1/surah'));
    final body = response.body;
    final result = jsonDecode(body);
    List<QuranModel> quranList = List.from(result['data'].map((qurans) => QuranModel.fromJson(qurans)));
    emit(QuranLoaded(quranResult: quranList));
  }

  
}
