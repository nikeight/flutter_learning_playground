import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimateScale extends StatefulWidget {
  const ImplicitAnimateScale({super.key});

  @override
  State<ImplicitAnimateScale> createState() => _ImplicitAnimateScaleState();
}

class _ImplicitAnimateScaleState extends State<ImplicitAnimateScale> {
  double scaleRatio = 0.5;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedScale(
              scale: scaleRatio,
              duration: const Duration(seconds: 1),
              child: Image.asset('assets/image/flash_logo.png'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                scaleRatio = random.nextDouble();
              });
            },
            child: const Text('Change Scale'),
          ),
        ],
      ),
    );
  }
}
