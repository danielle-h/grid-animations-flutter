import 'package:flutter/material.dart';

import '../widgets/photo_widget.dart';

class HeroSecond extends StatefulWidget {
  const HeroSecond({super.key});

  @override
  State<HeroSecond> createState() => _HeroSecondState();
}

class _HeroSecondState extends State<HeroSecond> {
  void onTap(String name) {
    print(name);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Second")),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            String name = "tree${index + 1}";
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
