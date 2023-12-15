import 'dart:math';

import 'package:flutter/material.dart';

class CustomImplicitExample extends StatefulWidget {
  const CustomImplicitExample({super.key});

  @override
  State<CustomImplicitExample> createState() => _CustomImplicitExampleState();
}

class _CustomImplicitExampleState extends State<CustomImplicitExample> {
  double percentage = 0.1;
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              focusNode.canRequestFocus = false;
            },
            child: TweenAnimationBuilder(
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
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Slider(
              allowedInteraction: SliderInteraction.tapOnly,
              activeColor: Colors.redAccent.shade200,
              inactiveColor: Colors.yellow.shade300,
              thumbColor: Colors.black,
              value: percentage,
              focusNode: focusNode,
              onChanged: (double newValue) {
                focusNode.canRequestFocus = true;
                setState(() {
                  percentage = newValue;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
