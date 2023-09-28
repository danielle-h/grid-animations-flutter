import 'package:flutter/material.dart';

//make clickable image widget
class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key, required this.onTap, required this.name});
  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          'images/$name.jpg',
          fit: BoxFit.contain,
        ),
      ),
    ));
  }
}
