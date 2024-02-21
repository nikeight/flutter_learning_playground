import 'dart:math';

import 'package:flutter/material.dart';

/// NOTES :
/// In Order to work with AnimatedPositioned it should be wrapped with [Stack]
/// Take Care of AnimatedPositioned Widget ancestors
/// Update either vertical or horizontal properties
class ImplicitAnimatePositionedDirectional extends StatefulWidget {
  const ImplicitAnimatePositionedDirectional({super.key});

  @override
  State<ImplicitAnimatePositionedDirectional> createState() =>
      _ImplicitAnimatePositionedDirectionalState();
}

class _ImplicitAnimatePositionedDirectionalState
    extends State<ImplicitAnimatePositionedDirectional> {
  double? topPositionValue = 100.0;
  double? endPositionValue = 100.0;
  double? widthValue = 200.0;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositionedDirectional(
          end: endPositionValue,
          top: topPositionValue,
          width: widthValue,
          duration: const Duration(seconds: 1),
          child: Image.asset(
            'assets/image/flash_logo.png',
            width: 300,
            height: 300,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  topPositionValue = random.nextInt(600).toDouble();
                  endPositionValue = random.nextInt(600).toDouble();
                  widthValue = random.nextInt(500).toDouble();
                });
              },
              child: const Text('Change Position'),
            ),
          ),
        ),
      ],
    );
  }
}
