import 'dart:math';

import 'package:flutter/material.dart';

// Todo : Add More data
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
      appBar: AppBar(
        title: const Text('Custom Implicit Animation',
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
            GestureDetector(
              onTap: () {
                focusNode.canRequestFocus = false;
              },
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.1, end: percentage),
                duration: const Duration(seconds: 2),
                builder: (_, double newPercentage, __) {
                  return Transform.rotate(
                    angle: pi * 2 * newPercentage,
                    child: Image.asset(
                      'assets/image/flash_logo.png',
                      width: 200,
                      height: 200,
                      opacity: AlwaysStoppedAnimation(newPercentage),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
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
            ),
            const SizedBox(height: 40),
            const Text(
              '⦿ Custom animations',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ TweenAnimationBuilder is used',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Coming from BeTWEEN concept',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Duration, Values, Builder',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⭐️ Builder for returning custom Widget',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
