import 'package:fetch_api_learn/model/model_film.dart';
import 'package:fetch_api_learn/services/film_service.dart';
import 'package:flutter/material.dart';

class FilmPage extends StatefulWidget {
  const FilmPage({super.key});

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  List<Film> filmResult = [];

  void fetchFilm() async {
    final film = await FilmService.fetchFilm();
    filmResult = film;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fetch Film Api',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final filmRes = filmResult[index];
          return Card(
            child: ListTile(
              title: Text('${filmRes.title}'),
              subtitle: Text('${filmRes.genre}'),
              // leading: Image.network(
              //   filmRes.poster,
              //   width: 100,
              //   height: 200,
              //   fit: BoxFit.cover,
              // ),
            ),
          );
        },
        itemCount: filmResult.length,
      ),
    );
  }
}
