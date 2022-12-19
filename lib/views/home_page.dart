import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation animation;
  late Animation animationcolor;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationcolor = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(animationController)
      ..addListener(() {
        setState(() {});
      });
      animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(color: animationcolor.value),
      ),
    )));
  }
}
