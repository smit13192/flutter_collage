import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ms/model/constant.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationTitle;
  late Animation animationSubtitle;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animationTitle = Tween(begin: 0.0, end: 70.0).animate(animationController);
    animationSubtitle =
        Tween(begin: 0.0, end: 12.0).animate(animationController);
    animationController.forward();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, mainPage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: AnimatedBuilder(
              animation: animationTitle,
              builder: (context, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appName,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: animationTitle.value,
                          fontWeight: FontWeight.w200),
                    ),
                    Text(
                      appThemeTitle,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: animationSubtitle.value),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
