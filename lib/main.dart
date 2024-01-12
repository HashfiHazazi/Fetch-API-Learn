import 'package:fetch_api_learn/pages/film_page.dart';
import 'package:fetch_api_learn/pages/home_page_stateful.dart';
import 'package:fetch_api_learn/pages/lorem_ipsum_page.dart';
import 'package:fetch_api_learn/pages/news_page.dart';
import 'package:fetch_api_learn/pages/quran_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
        fontFamily: 'Recoletta'
      ),
      home: const LoremIpsumPage(),
    );
  }
}
