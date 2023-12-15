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
      appBar: AppBar(
        title: const Text(
          'Implicit Animation',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: 36,
            )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: turns,
              duration: const Duration(seconds: 3),
              child: Image.asset(
                'assets/image/flash_logo.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              '⦿ Easy to Start',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Control by framework',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Need initial and final values',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Initial values remain same, final value changes',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⭐️ Support AnimatedFoo ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            turns = 10.0 * random.nextDouble();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
