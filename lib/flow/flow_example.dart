import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vect;

import '../widgets/photo_widget.dart';

//Grid animation example using Flow widget
class FlowExample extends StatefulWidget {
  const FlowExample({super.key});

  @override
  State<FlowExample> createState() => _FlowExampleState();
}

class _FlowExampleState extends State<FlowExample>
    with SingleTickerProviderStateMixin {
  //tab conroller
  late TabController _controller;
  //cross count in grid
  int crossCount = 2;

  @override
  void initState() {
    _controller = TabController(
        length: 2, vsync: this, animationDuration: const Duration(seconds: 1));

    _controller.addListener(() {
      setState(() {
        crossCount = _controller.index == 0 ? 2 : 3;
      });
    });
    super.initState();
  }

  Widget getItem(int index) {
    return PhotoWidget(onTap: () {}, name: "tree$index");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flow widget"),
          bottom: TabBar(controller: _controller, tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.science)),
          ]),
        ),
        body: Flow(
          delegate: ButtonFlowDelegate(animation: _controller.animation!),
          children: [
            getItem(1),
            getItem(2),
            getItem(3),
            getItem(4),
            getItem(5),
            getItem(6),
            getItem(7),
            getItem(8),
          ],
        ),
      ),
    );
  }
}

class ButtonFlowDelegate extends FlowDelegate {
  ButtonFlowDelegate({required this.animation}) : super(repaint: animation);

  final Animation<double> animation; //this will animate the flow
  //variables for internal use
  double crossCount = 0; //how many columns in grid
  double dimension = 1; //what is the size of each element
  final int startCrossCount = 2; //crossCount in home page
  final int endCrossCount = 3; // crossCount in star page
  double animValue = 0; //the current animation value - for readability.

  @override
  bool shouldRepaint(ButtonFlowDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    //variables
    double startX = 0;
    double startY = 0;
    double endX = 0.0;
    double endY = 0.0;
    int startRow = 0;
    int startCol = 0;
    int endRow = 0;
    int endCol = 0;

    crossCount = animation.value + startCrossCount;
    dimension = context.size.width / crossCount;
    //use this if you want a special curve:
    //animValue = Curves.elasticIn.transform(animation.value);
    //and this otherwise
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
                  //(-40 * animValue * animValue +
                  //40 * animValue)
                  ,
                  startY * (1 - animValue) + endY * animValue
                  //you can add your own "curve"
                  //+
                  //(-40 * animValue * animValue +
                  // 40 * animValue)
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
