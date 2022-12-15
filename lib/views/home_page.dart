import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                    child: IconTile(
                        color: Colors.purpleAccent,
                        icon: Icons.add,
                        text: "Add")),
                Expanded(
                    child: IconTile(
                        color: Colors.blueAccent,
                        icon: Icons.add_to_drive,
                        text: "Add To Drive"))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                    child: IconTile(
                        color: Colors.redAccent,
                        icon: Icons.delete_rounded,
                        text: "Trash")),
                Expanded(
                    child: IconTile(
                        color: Colors.greenAccent,
                        icon: Icons.gamepad,
                        text: "Play Store")),
              ],
            ),
          ),
          const Expanded(
              child: BoxTile(
                  color: Colors.pinkAccent,
                  icon: Icons.share_outlined,
                  text: "Share Location")),
          Expanded(
              child: BoxTile(
                  color: Colors.yellow.shade900,
                  icon: Icons.send_and_archive_rounded,
                  text: "Send Data"))
        ]),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  const IconTile(
      {super.key, required this.color, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    double radius = 30.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )
        ],
      ),
    );
  }
}

class BoxTile extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  const BoxTile(
      {super.key, required this.color, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    double radius = 30.0;

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius)),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ));
  }
}
