import 'package:flutter/material.dart';
import 'package:gridview_transitions/widgets/hero_photo_widget.dart';

import '../widgets/photo_widget.dart';

//second page demonstrating Hero widget, with 3x3 grid
class HeroSecond extends StatelessWidget {
  const HeroSecond({super.key});

  //tapping on any image returns to previous page
  void onTap(String name, BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Hero the second")),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            String name = "tree${index + 1}";
            return HeroPhotoWidget(
              onTap: () {
                onTap(name, context);
              },
              name: name,
            );
          },
        ),
      ),
    );
  }
}
