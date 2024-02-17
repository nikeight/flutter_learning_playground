import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimateOpacity extends StatefulWidget {
  const ImplicitAnimateOpacity({super.key});

  @override
  State<ImplicitAnimateOpacity> createState() => _ImplicitAnimateOpacityState();
}

class _ImplicitAnimateOpacityState extends State<ImplicitAnimateOpacity> {
  double opacityRatio = 0.5;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedOpacity(
              opacity: opacityRatio,
              duration: const Duration(seconds: 1),
              child: Image.asset('assets/image/flash_logo.png'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                opacityRatio = random.nextDouble();
              });
            },
            child: const Text('Change Opacity'),
          ),
        ],
      ),
    );
  }
}
