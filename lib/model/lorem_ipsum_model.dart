class LoremIpsumApi {
  final int id;
  final String title;
  final String body;

  LoremIpsumApi({required this.id, required this.title, required this.body});

  factory LoremIpsumApi.fromJson(Map<String, dynamic> json) {
    return LoremIpsumApi(
        id: json['id'], title: json['title'], body: json['body']);
  }
}
