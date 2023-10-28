import 'package:flutter/material.dart';

class HomeScreen_Titles extends StatefulWidget {
  const HomeScreen_Titles({
    super.key, required this.title, required this.title2, required this.onTap,
  });
  final String title;
  final String title2;
  final VoidCallback onTap;

  @override
  State<HomeScreen_Titles> createState() => _HomeScreen_TitlesState();
}

class _HomeScreen_TitlesState extends State<HomeScreen_Titles> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title,style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),),
        TextButton(onPressed: widget.onTap, child:  Text(widget.title2))
      ],
    );
  }
}
