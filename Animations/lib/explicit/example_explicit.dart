import 'dart:math';

import 'package:flutter/material.dart';

/// Performance tips
/// Create the Controller in the Init State to avoid creating Controller multiple times
/// Also Dispose method is necessary to avoid any Memory leakage
///
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
  void initState() {
    // Init Controller
    _rotationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )
      ..forward()
      ..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Init Animation
    _rotationAnimation = Tween<double>(begin: 0.0, end: (pi * 4.0)).animate(
        CurvedAnimation(
            parent: _rotationController, curve: Curves.easeInToLinear));

    return Center(
      child: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _rotationAnimation,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/image/flash_logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _rotationController.forward();
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
