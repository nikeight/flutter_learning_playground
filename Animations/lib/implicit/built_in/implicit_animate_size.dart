import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimateSize extends StatefulWidget {
  const ImplicitAnimateSize({super.key});

  @override
  State<ImplicitAnimateSize> createState() => _ImplicitAnimateSizeState();
}

class _ImplicitAnimateSizeState extends State<ImplicitAnimateSize> {
  double childSize = 50.0;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSize(
              duration: const Duration(seconds: 5),
              curve: Curves.fastEaseInToSlowEaseOut,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/image/flash_logo.png',
                width: childSize,
                height: childSize,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                childSize = random.nextInt(500).toDouble();
              });
            },
            child: const Text('Change Size'),
          ),
        ],
      ),
    );
  }
}
