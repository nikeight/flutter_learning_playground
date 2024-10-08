import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SquareContainerAnimation extends StatefulWidget {
  const SquareContainerAnimation({super.key});

  @override
  State<SquareContainerAnimation> createState() =>
      _SquareContainerAnimationState();
}

class _SquareContainerAnimationState extends State<SquareContainerAnimation>
    with TickerProviderStateMixin {

  late AnimationController _sizeController;
  late AnimationController _rotationController;
  late AnimationController _dragAnimateController;

  late Animation<double> _animationOne;
  late Animation<double> _animationTwo;
  late Animation<double> _animationThree;
  late Animation<double> _animationFour;
  late Animation<double> _animationFive;
  late Animation<double> _rotationAnimation;
  late Animation<Alignment> _dragAnimation;

  Alignment _newOffSetAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );

    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _dragAnimateController =
        AnimationController.unbounded(vsync: this,duration: const Duration(milliseconds: 1500));

    _animationOne = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _sizeController,
        curve: const Interval(
          0.0,
          0.200,
          curve: Curves.ease,
        ),
      ),
    );

    _animationTwo = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _sizeController,
        curve: const Interval(
          0.200,
          0.400,
          curve: Curves.ease,
        ),
      ),
    );

    _animationThree = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _sizeController,
        curve: const Interval(
          0.400,
          0.600,
          curve: Curves.ease,
        ),
      ),
    );

    _animationFour = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _sizeController,
        curve: const Interval(
          0.600,
          0.800,
          curve: Curves.ease,
        ),
      ),
    );

    _animationFive = Tween<double>(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _sizeController,
        curve: const Interval(
          0.800,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 4.0),
    ).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.bounceOut,
      ),
    );

    _playAnimationForward();

    _dragAnimateController.addListener(() {
      setState(() {
        _newOffSetAlignment = _dragAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sizeController.dispose();
    _rotationController.dispose();
    _dragAnimateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onPanDown: (details) {
          _dragAnimateController.stop();
        },
        onPanUpdate: (details) {
          setState(() {
            _newOffSetAlignment += Alignment(
              details.delta.dx / (size.width / 2),
              details.delta.dy / (size.width / 2),
            );
          });
        },
        onPanEnd: (details) {
          _runAnimation(details.velocity.pixelsPerSecond, size);
        },
        child: Center(
          child: AnimatedBuilder(
            animation: _sizeController,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateY(
                    _rotationAnimation.value,
                  ),
                child: Align(
                  alignment: _newOffSetAlignment,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: _animationFive.value,
                        height: _animationFive.value,
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        width: _animationFour.value,
                        height: _animationFour.value,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        width: _animationThree.value,
                        height: _animationThree.value,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        width: _animationTwo.value,
                        height: _animationTwo.value,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        width: _animationOne.value,
                        height: _animationOne.value,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _playAnimationForward() async {
    try {
      await _sizeController.forward().orCancel;
      await _rotateTheCubeCounterClockWise();
      await _playAnimationReverse();
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Future<void> _playAnimationReverse() async {
    try {
      await _sizeController.reverse().orCancel;
      await _rotateTheCubeClockWise();
      await _playAnimationForward();
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Future<void> _rotateTheCubeCounterClockWise() async {
    _rotationAnimation = Tween<double>(
      begin: _rotationAnimation.value,
      end: _rotationAnimation.value - 2 * pi,
    ).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.bounceOut,
      ),
    );
    _rotationController
      ..reset()
      ..forward();
  }

  Future<void> _rotateTheCubeClockWise() async {
    _rotationAnimation = Tween<double>(
      begin: _rotationAnimation.value,
      end: _rotationAnimation.value + 2 * pi,
    ).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.bounceOut,
      ),
    );
    _rotationController
      ..reset()
      ..forward();
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _dragAnimation = _dragAnimateController.drive(
      AlignmentTween(
        begin: _newOffSetAlignment,
        end: Alignment.center,
      ),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 1,
      stiffness: 50,
      damping: 1.00,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _dragAnimateController.animateWith(simulation);
  }
}
