import 'package:flutter/material.dart';
import 'package:gridview_transitions/widgets/photo_widget.dart';

class AnimatedPosExample extends StatefulWidget {
  const AnimatedPosExample({super.key});

  @override
  State<AnimatedPosExample> createState() => _AnimatedPosExampleState();
}

class _AnimatedPosExampleState extends State<AnimatedPosExample>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int _currentIndex = 0;
  int crossCount = 2;
  Duration animationDuration = const Duration(milliseconds: 300);
  double dimension = 0;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    controller.addListener(() {
      setState(() {
        _currentIndex = controller.index;
        crossCount = _currentIndex == 0 ? 2 : 3;
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

  @override
  Widget build(BuildContext context) {
    //get dimension of one item
    dimension = MediaQuery.of(context).size.width / crossCount;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(controller: controller, tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.star)),
          ]),
        ),
        body: Stack(
          children: [
            AnimatedPositioned(
                height: _currentIndex == 0 ? 0 : dimension,
                top: 0, //_currentIndex == 0 ? -dimension : 0,
                left: 0,
                duration: animationDuration,
                child: getItem(1)),
            AnimatedPositioned(
                height: dimension,
                top: 0,
                left: _currentIndex == 0 ? 0 : dimension,
                duration: animationDuration,
                child: getItem(2)),
            AnimatedPositioned(
                height: dimension,
                top: 0,
                left: _currentIndex == 0 ? dimension : dimension * 2,
                duration: animationDuration,
                child: getItem(3)),
            AnimatedPositioned(
                height: dimension,
                top: dimension,
                left: 0,
                duration: animationDuration,
                child: getItem(4)),
            AnimatedPositioned(
                //curve: Curves.ease,
                height: dimension,
                top: dimension,
                left: dimension,
                duration: animationDuration,
                child: getItem(5)),
            AnimatedPositioned(
                height: _currentIndex == 0 ? 0 : dimension,
                top: dimension, //_currentIndex == 0 ? -dimension : 0,
                left: dimension * 2,
                duration: animationDuration,
                child: getItem(6)),
            AnimatedPositioned(
                height: _currentIndex == 0 ? 0 : dimension,
                top: dimension * 2, //_currentIndex == 0 ? -dimension : 0,
                left: 0,
                duration: animationDuration,
                child: getItem(7)),
            AnimatedPositioned(
                height: _currentIndex == 0 ? 0 : dimension,
                top: dimension * 2, //_currentIndex == 0 ? -dimension : 0,
                left: dimension,
                duration: animationDuration,
                child: getItem(8)),
          ],
        ),
      ),
    );
  }
}
