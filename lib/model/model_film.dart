class Film {
  final String title;
  final String genre;
  final String poster;

  Film({required this.title, required this.genre, required this.poster});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        title: json["Title"], genre: json["Genre"], poster: json["Poster"]);
  }

  
}
