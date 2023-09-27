import 'package:flutter/material.dart';
import 'package:gridview_transitions/widgets/photo_widget.dart';

class NoAnimationExample extends StatefulWidget {
  const NoAnimationExample({super.key});

  @override
  State<NoAnimationExample> createState() => _NoAnimationExampleState();
}

class _NoAnimationExampleState extends State<NoAnimationExample>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int _currentIndex = 0;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    controller.addListener(() {
      setState(() {
        _currentIndex = controller.index;
      });
    });
    super.initState();
  }

  Widget getItem(int index) {
    return PhotoWidget(onTap: () {}, name: "tree$index");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget firstGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        String name = "tree${index + 2}";
        return PhotoWidget(
          onTap: () {},
          name: name,
        );
      },
    );
  }

  Widget secondGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        String name = "tree${index + 1}";
        return PhotoWidget(
          onTap: () {},
          name: name,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //get dimension of one item

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("No animation"),
            bottom: TabBar(controller: controller, tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.star)),
            ]),
          ),
          body: _currentIndex == 0 ? firstGrid() : secondGrid()),
    );
  }
}
