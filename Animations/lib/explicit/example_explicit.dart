import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
    _rotationAnimation = Tween<double>(begin: 0.0, end: 3.0).animate(
        CurvedAnimation(
            parent: _rotationController,
            curve: Curves.fastEaseInToSlowEaseOut));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explicit Animation',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.normal,
            fontSize: 36,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return RotationTransition(
                  turns: _rotationAnimation,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/image/flash_logo.png',
                    width: 200,
                    height: 200,
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            const Text(
              '⦿ Repeat Animation',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Steps/Stages based ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Controlled by Developers, Through AnimationController',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Built under AnimatedBuilder',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⭐️ Takes Animation<Double> type values',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⭐️ Support FooTransition ',
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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_arrow,
        direction: SpeedDialDirection.up,
        spaceBetweenChildren: 16,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.repeat_one),
              label: 'Reverse',
              onTap: () {
                _rotationController.reverse();
              }),
          SpeedDialChild(
              child: const Icon(Icons.play_circle),
              label: 'Play',
              onTap: () {
                _rotationController
                  ..forward()
                  ..repeat();
              }),
          SpeedDialChild(
              child: const Icon(Icons.pause_circle),
              label: 'Pause',
              onTap: () {
                _rotationController.stop();
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }
}
