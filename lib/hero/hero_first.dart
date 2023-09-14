import 'package:flutter/material.dart';
import 'package:gridview_transitions/hero/hero_second.dart';

import '../widgets/photo_widget.dart';

class HeroFirst extends StatelessWidget {
  HeroFirst({super.key});

  void onTap(String name, BuildContext context) {
    print(name);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HeroSecond();
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
            return PhotoWidget(
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
