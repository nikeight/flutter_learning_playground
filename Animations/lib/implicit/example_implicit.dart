import 'dart:math';

import 'package:flutter/material.dart';

/// Animation State needed to be changed everytime in order to work
/// Can't repeat and stop at middle
/// Once initialized nothing changes until the Widget is re-drawn with new value
class ImplicitExample extends StatefulWidget {
  const ImplicitExample({super.key});

  @override
  State<ImplicitExample> createState() => _ImplicitExampleState();
}

class _ImplicitExampleState extends State<ImplicitExample> {
  final Random random = Random();
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRotation(
          turns: turns,
          duration: const Duration(seconds: 3),
          child: Image.asset(
            'assets/image/flash_logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            turns = 10.0 * random.nextDouble();
          });
        },
        child:  const Icon(Icons.play_arrow),
      ),
    );
  }
}
