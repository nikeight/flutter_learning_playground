import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimateContainer extends StatefulWidget {
  const ImplicitAnimateContainer({super.key});

  @override
  State<ImplicitAnimateContainer> createState() =>
      _ImplicitAnimateContainerState();
}

class _ImplicitAnimateContainerState extends State<ImplicitAnimateContainer> {
  double _height = 100.0;
  double _width = 100.0;
  double _radius = 10.0;
  double minimumValue = 100.0;

  List<Color> colorsList = [
    Colors.black,
    Colors.pink,
    Colors.green,
    Colors.yellow,
    Colors.blueAccent,
    Colors.deepPurple,
  ];

  Color _color = Colors.black;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: _color, borderRadius: BorderRadius.circular(_radius)),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SizedBox(
                  width: 90,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _radius = random.nextInt(100).toDouble();
                          _width =
                              random.nextInt(300).toDouble() + minimumValue;
                          _height =
                              random.nextInt(300).toDouble() + minimumValue;
                          _color =
                              colorsList[random.nextInt(colorsList.length)];
                        });
                      },
                      child: const Center(
                        child: Text(
                          'Change',
                          style: TextStyle(fontSize: 10),
                        ),
                      )),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
