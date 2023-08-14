import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        container(
          alignment: Alignment.center,
          child: Text('iTeach'),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
        home: Scaffold(
            backgroundColor: Color(0xFF0079d2),
        ),
      );
    }
  }
  