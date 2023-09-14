import 'package:flutter/material.dart';
import 'package:gridview_transitions/hero/hero_second.dart';

import '../widgets/photo_widget.dart';

class HeroFirst extends StatefulWidget {
  HeroFirst({super.key});

  @override
  State<HeroFirst> createState() => _HeroFirstState();
}

class _HeroFirstState extends State<HeroFirst> {
  void onTap(String name) {
    print(name);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HeroSecond();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("First")),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            String name = "tree${index + 2}";
            return PhotoWidget(
              onTap: () {
                onTap(name);
              },
              name: name,
            );
          },
        ),
      ),
    );
  }
}
