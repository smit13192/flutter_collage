import 'package:flutter/material.dart';
import 'package:ms/views/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomePage(),
    );
  }
}