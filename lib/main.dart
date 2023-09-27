import 'package:flutter/material.dart';
import 'package:gridview_transitions/animated/animated_pos.dart';
import 'package:gridview_transitions/flow/flow_example.dart';
import 'package:gridview_transitions/hero/hero_first.dart';
import 'package:gridview_transitions/none/no_anim.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.circular(20))),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 30))))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Grid transitions",
            style: TextStyle(color: Colors.teal[100]),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NoAnimationExample();
                      }));
                    },
                    child: const Text("None")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HeroFirst();
                      }));
                    },
                    child: const Text("Hero")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AnimatedPosExample();
                      }));
                    },
                    child: const Text("AnimatedPositioned")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return FlowExample();
                      }));
                    },
                    child: const Text("Flow")),
              ]),
        ),
      ),
    );
  }
}
