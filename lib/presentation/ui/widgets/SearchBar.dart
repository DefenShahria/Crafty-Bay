import 'package:flutter/material.dart';

class Search_bar extends StatefulWidget {
  const Search_bar({
    super.key,
  });

  @override
  State<Search_bar> createState() => _Search_barState();
}

class _Search_barState extends State<Search_bar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        border: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
      ),
    );
  }
}