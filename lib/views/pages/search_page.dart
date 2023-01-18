import 'package:flutter/material.dart';
import 'package:ms/views/widgets/textfeild_border.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          TextField(
            controller: search,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.all(10),
                hintText: "Search",
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                suffixIcon: IconButton(
                    onPressed: () {
                      search.text = "";
                    }, icon: const Icon(Icons.clear))),
          ),
        ],
      ),
    );
  }
}
