import 'package:flutter/material.dart';
import 'package:gridview_transitions/widgets/photo_widget.dart';

//wraps photowidget with a Hero for the hero example
class HeroPhotoWidget extends StatelessWidget {
  const HeroPhotoWidget({super.key, required this.onTap, required this.name});
  final VoidCallback onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Hero(tag: name, child: PhotoWidget(onTap: onTap, name: name));
  }
}
