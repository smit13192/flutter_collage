import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms/model/constanat.dart';
import 'package:ms/views/pages/home_page.dart';
import 'package:ms/views/pages/splash_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      
      home: const SpalshPage(),
      onGenerateRoute: (settings) {
        String? routeName = settings.name;
        switch (routeName) {
          case splashPage:
            return MaterialPageRoute(builder: (context) => const SpalshPage());
          case homePage:
            return MaterialPageRoute(builder: (context) => const HomePage());
          default:
            return MaterialPageRoute(builder: (context) => const SpalshPage());
        }
      },
    );
  }
}
