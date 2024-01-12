import 'package:fetch_api_learn/model/lorem_ipsum_model.dart';
import 'package:fetch_api_learn/pages/detail_lorem_ipsum_page.dart';
import 'package:fetch_api_learn/services/lorem_ipsum_service.dart';
import 'package:flutter/material.dart';

class LoremIpsumPage extends StatefulWidget {
  const LoremIpsumPage({super.key});

  @override
  State<LoremIpsumPage> createState() => _LoremIpsumPageState();
}

class _LoremIpsumPageState extends State<LoremIpsumPage> {
  List<LoremIpsumApi> loremIpsum = [];

  void fetchLoremIpsumApi() async {
    final result = await LoremIpsumApiService.fetchLoremIpsumApi();
    loremIpsum = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchLoremIpsumApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lorem Ipsum API Fetch',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            final loremIpsumResult = loremIpsum[index];
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                      title: Text(
                        '${loremIpsumResult.title}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${loremIpsumResult.body}',
                          overflow: TextOverflow.ellipsis, maxLines: 3),
                      leading: CircleAvatar(
                        child: Text('${loremIpsumResult.id}'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => DetailLoremIpsumPage(
                                  id: '${loremIpsumResult.id}',
                                  title: loremIpsumResult.title,
                                  body: '${loremIpsumResult.body}')),
                        );
                      }),
                ));
          },
          itemCount: loremIpsum.length),
    );
  }
}
