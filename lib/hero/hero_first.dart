import 'package:flutter/material.dart';
import 'package:gridview_transitions/hero/hero_second.dart';
import 'package:gridview_transitions/widgets/hero_photo_widget.dart';

import '../widgets/photo_widget.dart';

//first page, showing 2X2 grid
class HeroFirst extends StatelessWidget {
  const HeroFirst({super.key});

  //tapping on any image will move to second page
  void onTap(String name, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const HeroSecond();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Hero the first")),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            String name = "tree${index + 2}";
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
