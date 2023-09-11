import 'package:flutter/material.dart';

class AykaAvatar extends StatelessWidget {
  const AykaAvatar({Key? key, required this.name}) : super(key: key);
  final String name; //default male, 0-male, 1-female, 2-other
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.purple,
      foregroundColor: Colors.black,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : "",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
