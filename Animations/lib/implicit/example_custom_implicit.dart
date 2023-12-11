import 'dart:math';

import 'package:flutter/material.dart';

class CustomImplicitExample extends StatefulWidget {
  const CustomImplicitExample({super.key});

  @override
  State<CustomImplicitExample> createState() => _CustomImplicitExampleState();
}

class _CustomImplicitExampleState extends State<CustomImplicitExample> {
  double percentage = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            tween: Tween(begin: 0.1, end: percentage),
            duration: const Duration(seconds: 2),
            builder: (_, double newPercentage, __) {
              return Transform.rotate(
                angle: pi * 4 * newPercentage,
                child: Image.asset(
                  'assets/image/flash_logo.png',
                  width: 100,
                  height: 100,
                  opacity: AlwaysStoppedAnimation(newPercentage),
                ),
              );
            },
          ),
          Slider.adaptive(
            value: percentage,
            onChanged: (double newValue) {
              setState(() {
                percentage = newValue;
              });
            },
          )
        ],
      ),
    );
  }
}
