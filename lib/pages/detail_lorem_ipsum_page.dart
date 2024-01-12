import 'package:flutter/material.dart';

class DetailLoremIpsumPage extends StatelessWidget {
  final String id;
  final String title;
  final String body;

  const DetailLoremIpsumPage({super.key, required this.id, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            'Details Lorem Ipsum',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 64,
                        height: 64,
                        child: CircleAvatar(
                          child: Text('$id', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('$title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      SizedBox(height: 10,),
                      Text('$body', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ),
    );
  }
}
