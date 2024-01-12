import 'package:fetch_api_learn/model/user.dart';
import 'package:fetch_api_learn/services/user_services.dart';
import 'package:flutter/material.dart';

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({super.key});

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  List<User> users = [];

  void fetchUser() async {
    final result = await UserService.fetchUser();
    users = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Fetch API Learn', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = users[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text('${user.email}'),
                leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar),),
              ),
            ),
          );
        },
        itemCount: users.length,
      ),
    );
  }
}
