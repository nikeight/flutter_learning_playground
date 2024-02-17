import 'dart:math';

import 'package:flutter/widgets.dart';

class ImplicitAnimateSlide extends StatefulWidget {
  const ImplicitAnimateSlide({super.key});

  @override
  State<ImplicitAnimateSlide> createState() => _ImplicitAnimateSlideState();
}

class _ImplicitAnimateSlideState extends State<ImplicitAnimateSlide> {
  Offset offset = const Offset(12,6);
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: offset,
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: () {
          setState(() {
            offset = Offset(
              random.nextDouble() * random.nextInt(10),
              random.nextDouble() * random.nextInt(10),
            );
          });
        },
        child: Image.asset(
          'assets/image/flash_logo.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
