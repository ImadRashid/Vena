import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  _auth.signOut();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Get.snackbar("Sucess", "User Logged out");
                },
                child: Icon(Icons.outbox)),
          )
        ],
      ),
    );
  }
}
