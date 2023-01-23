import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms/controller/product_description_scroll.dart';
import 'package:ms/model/constant.dart';
import 'package:ms/views/pages/home_page.dart';
import 'package:ms/views/pages/login_support_page.dart';
import 'package:ms/views/pages/main_page.dart';
import 'package:ms/views/pages/product_description_page.dart';
import 'package:ms/views/pages/splash_page.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ProductDescriptionScroll());
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
          case supportRegisterPage:
            return MaterialPageRoute(
                builder: (context) => const LoginSupportPage());
          case mainPage:
            return MaterialPageRoute(builder: (context) => const MainPage());
          case productDescription:
            String id = settings.arguments as String;
            return MaterialPageRoute(
                builder: (context) => ProductDescription(id: id));

          default:
            return MaterialPageRoute(builder: (context) => const SpalshPage());
        }
      },
    );
  }
}
