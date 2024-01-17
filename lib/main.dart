import 'package:fetch_api_learn/pages/film_page.dart';
import 'package:fetch_api_learn/pages/home_page_stateful.dart';
import 'package:fetch_api_learn/pages/landing_quran_page.dart';
import 'package:fetch_api_learn/pages/lorem_ipsum_page.dart';
import 'package:fetch_api_learn/pages/news_page.dart';
import 'package:fetch_api_learn/pages/quran_cubit_page.dart';
import 'package:fetch_api_learn/pages/quran_page.dart';
import 'package:fetch_api_learn/view_model/cubit/quran_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => QuranCubit()..fetchQuran(),
        child: const LandingQuranPage(),
      ),
    );
  }
}
