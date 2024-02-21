import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimatePhysicalModal extends StatefulWidget {
  const ImplicitAnimatePhysicalModal({super.key});

  @override
  State<ImplicitAnimatePhysicalModal> createState() =>
      _ImplicitAnimatePhysicalModalState();
}

class _ImplicitAnimatePhysicalModalState
    extends State<ImplicitAnimatePhysicalModal> {
  Color shadowColor = Colors.deepOrangeAccent;
  Random random = Random();

  final shadowColorsList = [
    Colors.black54,
    Colors.amber,
    Colors.amberAccent,
    Colors.black26,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedPhysicalModel(
              animateShadowColor: true,
              animateColor: true,
              elevation: 32,
              shadowColor: shadowColor,
              color: Colors.transparent,
              shape: BoxShape.circle,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/image/batman_logo.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {
              setState(() {
                shadowColor =
                    shadowColorsList[random.nextInt(shadowColorsList.length)];
              });
            },
            child: const Text('Change Shadow Color'),
          ),
        ],
      ),
    );
  }
}
