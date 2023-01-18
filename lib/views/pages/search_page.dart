import 'package:flutter/material.dart';
import 'package:ms/views/widgets/textfeild_border.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextField(
              decoration:
                  InputDecoration(hintText: "Search", border: enabledBorder),
            ),
          ],
        ),
      ),
    );
  }
}
