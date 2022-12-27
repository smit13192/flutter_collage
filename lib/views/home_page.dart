import 'package:flutter/material.dart';
import 'package:ms/model/constanat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          appName,
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(),
        ),
      ),
    );
  }
}
