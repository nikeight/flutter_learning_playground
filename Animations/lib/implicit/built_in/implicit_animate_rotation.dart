import 'dart:math';
import 'package:flutter/material.dart';

class ImplicitAnimateRotation extends StatefulWidget {
  const ImplicitAnimateRotation({super.key});

  @override
  State<ImplicitAnimateRotation> createState() =>
      _ImplicitAnimateRotationState();
}

class _ImplicitAnimateRotationState extends State<ImplicitAnimateRotation> {
  double rotationTurns = 1;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(42.0),
            child: AnimatedRotation(
              turns: rotationTurns,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/image/flash_logo.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                rotationTurns = random.nextDouble() * pi;
              });
            },
            child: const Text('Rotate Logo'),
          ),
        ],
      ),
    );
  }
}
