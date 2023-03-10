import 'package:flutter/material.dart';
import 'package:ms/model/constant.dart';
import 'package:ms/views/pages/cart_page.dart';
import 'package:ms/views/pages/product_page.dart';
import 'package:ms/views/pages/profile_page.dart';
import 'package:ms/views/pages/search_page.dart';

import '../widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavigationIndex = 0;

  List<Widget> pages = [
    const ProductPage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          appName,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w200,
            letterSpacing: 2,
          ),
        ),
      ),
      body: IndexedStack(
        index: bottomNavigationIndex,
        children: pages,
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        bottomNavigationIndex: bottomNavigationIndex,
        onTabChanged: (value) => setState(() => bottomNavigationIndex = value),
      ),
    );
  }
}
