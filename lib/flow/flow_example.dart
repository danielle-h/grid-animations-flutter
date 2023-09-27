import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vect;

import '../widgets/photo_widget.dart';

class FlowExample extends StatefulWidget {
  const FlowExample({super.key});

  @override
  State<FlowExample> createState() => _FlowExampleState();
}

class _FlowExampleState extends State<FlowExample>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int crossCount = 2;
  int _currentIndex = 0;

  @override
  void initState() {
    controller = TabController(
        length: 2, vsync: this, animationDuration: Duration(seconds: 1));

    controller.addListener(() {
      setState(() {
        _currentIndex = controller.index;
        crossCount = _currentIndex == 0 ? 2 : 3;
      });
    });
    super.initState();
  }

  Widget getItem(int index, double dimension) {
    return PhotoWidget(onTap: () {}, name: "tree$index");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double dimension = MediaQuery.of(context).size.width / crossCount;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flow widget"),
          bottom: TabBar(controller: controller, tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.science)),
          ]),
        ),
        body: Flow(
          delegate: ButtonFlowDelegate(animation: controller.animation!),
          children: [
            getItem(1, dimension),
            getItem(2, dimension),
            getItem(3, dimension),
            getItem(4, dimension),
            getItem(5, dimension),
            getItem(6, dimension),
            getItem(7, dimension),
            getItem(8, dimension),
          ],
        ),
      ),
    );
  }
}

class ButtonFlowDelegate extends FlowDelegate {
  ButtonFlowDelegate({required this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  double crossCount = 0;
  double dimension = 1;
  int startCrossCount = 2;
  int endCrossCount = 3;
  double animValue = 0;

  @override
  bool shouldRepaint(ButtonFlowDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double endX = 0.0;
    double endY = 0.0;
    int endRow = 0;
    int startRow = 0;
    int startCol = 0;
    int endCol = 0;
    double startX = 0;
    double startY = 0;
    crossCount = animation.value + startCrossCount;
    dimension = context.size.width / crossCount;
    //use this if you want a special curve:
    //animValue = Curves.elasticIn.transform(animation.value);
    animValue = animation.value;

    for (int i = 0; i < context.childCount; ++i) {
      bool notVisible = i == 0 || i == 5 || i == 6 || i == 7;
      //starting row and column (when in home page)
      startRow = notVisible ? -1 : ((i - 1) / startCrossCount).floor();
      startCol = notVisible ? -1 : (i - 1) % startCrossCount;
      //end row and column (when in star page)
      endRow = ((i) / endCrossCount).floor();
      endCol = (i) % endCrossCount;
      //position at the start in pixels
      startX = dimension * startCol;
      startY = dimension * startRow;
      //position at the end in pixels
      endX = dimension * endCol;
      endY = dimension * endRow;

      context.paintChild(i,
          transform: Matrix4.compose(
              vect.Vector3(
                  startX * (1 - animValue) + endX * animValue
                  //you can add your own "curve"
                  //+
                  //(-40 * animation.value * animation.value +
                  //40 * animation.value)
                  ,
                  startY * (1 - animValue) + endY * animValue
                  //you can add your own "curve"
                  //+
                  //(-40 * animation.value * animation.value +
                  // 40 * animation.value)
                  ,
                  0),
              //no rotation:
              //vect.Quaternion.identity(),
              //small rotation:
              vect.Quaternion.axisAngle(vect.Vector3(0, 0, 1), 0.1 * animValue),
              //scaling
              vect.Vector3(
                  notVisible ? 1 / 3 * animValue : -1 / 6 * animValue + 1 / 2,
                  notVisible ? 1 / 3 * animValue : -1 / 6 * animValue + 1 / 2,
                  0)));
    }
  }
}
