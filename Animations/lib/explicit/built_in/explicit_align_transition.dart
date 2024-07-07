import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitAlignTransition extends StatefulWidget {
  const ExplicitAlignTransition({super.key});

  @override
  State<ExplicitAlignTransition> createState() =>
      _ExplicitAlignTransitionState();
}

class _ExplicitAlignTransitionState extends State<ExplicitAlignTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<AlignmentGeometry> animation;
  Alignment newAlignment = Alignment.topLeft;

  final positionList = [
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.bottomRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.topLeft,
  ];

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = AlignmentTween(
      begin: Alignment.center,
      end: newAlignment,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        AlignTransition(
          alignment: animation,
          child: Image.asset(
            'assets/image/flash_logo.png',
            height: 100,
            width: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    newAlignment =
                        positionList[Random().nextInt(positionList.length)];
                    controller.forward();
                  });
                },
                child: const Text('Change Position'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    controller.reset();
                  });
                },
                child: const Text('Back to Center'),
              )
            ],
          ),
        )
      ],
    );
  }
}
