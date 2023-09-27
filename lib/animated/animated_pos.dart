import 'package:flutter/material.dart';
import 'package:gridview_transitions/widgets/photo_widget.dart';

class AnimatedPosExample extends StatefulWidget {
  const AnimatedPosExample({super.key});

  @override
  State<AnimatedPosExample> createState() => _AnimatedPosExampleState();
}

class _AnimatedPosExampleState extends State<AnimatedPosExample>
    with SingleTickerProviderStateMixin {
  //tab stuff
  late TabController controller;
  int _currentIndex = 0;
  int crossCount = 2;
  Duration animationDuration = const Duration(milliseconds: 500);
  double dimension = 0;
  Curve animationCurve = Curves.easeInCirc;

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
          title: const Text("Animated positioned"),
          bottom: TabBar(controller: controller, tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.star)),
          ]),
        ),
        body: Stack(
          children: [
            AnimatedPositioned(
                curve: animationCurve,
                height: _currentIndex == 0 ? 0 : dimension,
                top: _currentIndex == 0 ? 0 : 0,
                left: 0,
                duration: animationDuration,
                child: getItem(1)),
            AnimatedPositioned(
                curve: animationCurve,
                height: dimension,
                top: 0,
                left: _currentIndex == 0 ? 0 : dimension,
                duration: animationDuration,
                child: getItem(2)),
            AnimatedPositioned(
                curve: animationCurve,
                height: dimension,
                top: 0,
                left: _currentIndex == 0 ? dimension : dimension * 2,
                duration: animationDuration,
                child: getItem(3)),
            AnimatedPositioned(
                curve: animationCurve,
                height: dimension,
                top: dimension,
                left: 0,
                duration: animationDuration,
                child: getItem(4)),
            AnimatedPositioned(
                curve: animationCurve,
                height: dimension,
                top: dimension,
                left: dimension,
                duration: animationDuration,
                child: getItem(5)),
            AnimatedPositioned(
                curve: animationCurve,
                height: _currentIndex == 0 ? 0 : dimension,
                top: _currentIndex == 0 ? 0 : dimension,
                left: _currentIndex == 0 ? 0 : dimension * 2,
                duration: animationDuration,
                child: getItem(6)),
            AnimatedPositioned(
                curve: animationCurve,
                height: _currentIndex == 0 ? 0 : dimension,
                top: _currentIndex == 0 ? 0 : 2 * dimension,
                left: 0,
                duration: animationDuration,
                child: getItem(7)),
            AnimatedPositioned(
                curve: animationCurve,
                height: _currentIndex == 0 ? 0 : dimension,
                top: _currentIndex == 0 ? 0 : 2 * dimension,
                left: _currentIndex == 0 ? 0 : dimension,
                duration: animationDuration,
                child: getItem(8)),
          ],
        ),
      ),
    );
  }
}
