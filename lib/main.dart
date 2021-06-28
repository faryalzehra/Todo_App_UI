import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Center(
              child: Text(
            "Todo App",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          )),
        ),
        body: TodoApp(),
      ),);
  }
}
