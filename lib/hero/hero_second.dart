import 'package:flutter/material.dart';

import '../widgets/photo_widget.dart';

class HeroSecond extends StatelessWidget {
  const HeroSecond({super.key});

  void onTap(String name, BuildContext context) {
    print(name);
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
