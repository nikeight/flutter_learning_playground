import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitExample extends StatefulWidget {
  const ExplicitExample({super.key});

  @override
  State<ExplicitExample> createState() => _ExplicitExampleState();
}

class _ExplicitExampleState extends State<ExplicitExample>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  Widget build(BuildContext context) {
    // Init Controller
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: (pi * 6.0)).animate(
        CurvedAnimation(parent: _rotationController, curve: Curves.easeInToLinear));

    return Center(
      child: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: _rotationAnimation.value,
                child: Image.asset(
                  'assets/image/flash_logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _rotationController.forward();
                    _rotationController.repeat();
                  },
                  child: const Text("Play")),
              ElevatedButton(
                  onPressed: () {
                    _rotationController.stop();
                  },
                  child: const Text("Pause")),
              ElevatedButton(
                  onPressed: () {
                    _rotationController.reverse();
                  },
                  child: const Text("Reverse")),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }
}
