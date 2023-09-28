import 'package:flutter/material.dart';
import 'package:gridview_transitions/widgets/photo_widget.dart';

class NoAnimationExample extends StatefulWidget {
  const NoAnimationExample({super.key});

  @override
  State<NoAnimationExample> createState() => _NoAnimationExampleState();
}

class _NoAnimationExampleState extends State<NoAnimationExample>
    with SingleTickerProviderStateMixin {
  //controller for tab
  late TabController controller;
  //current tab index
  int _currentIndex = 0;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    controller.addListener(() {
      setState(() {
        //update current index
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
    //don't forget to dispose of the controller
    controller.dispose();
    super.dispose();
  }

  //grid with 4 items, cross axis count is 2
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

  //grid with 8 items, cross axis count is 3
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("No animation"),
            //tab bar
            bottom: TabBar(controller: controller, tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.star)),
            ]),
          ),
          //show different grid based on tab index
          body: _currentIndex == 0 ? firstGrid() : secondGrid()),
    );
  }
}
