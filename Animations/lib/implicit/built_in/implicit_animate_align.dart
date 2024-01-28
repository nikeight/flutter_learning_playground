import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimateAlign extends StatefulWidget {
  const ImplicitAnimateAlign({super.key});

  @override
  State<ImplicitAnimateAlign> createState() => _ImplicitAnimateAlignState();
}

class _ImplicitAnimateAlignState extends State<ImplicitAnimateAlign> {
  bool selected = false;
  List<Alignment> randomAlignmentList = [
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.bottomCenter,
    Alignment.topRight,
    Alignment.topLeft,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedAlign(
          alignment: selected
              ? randomAlignmentList[
                  Random().nextInt(randomAlignmentList.length)]
              : Alignment.center,
          duration: const Duration(seconds: 1, milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          child: Image.asset(
            'assets/image/flash_logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
