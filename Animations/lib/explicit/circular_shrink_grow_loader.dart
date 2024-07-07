import 'dart:math';

import 'package:flutter/material.dart';

class CircularShrinkGrowLoader extends StatefulWidget {
  const CircularShrinkGrowLoader({super.key});

  @override
  State<CircularShrinkGrowLoader> createState() => _CircularShrinkGrowLoaderState();
}

// Number of Hands (360/45)
const int _linesSize = 8;

class _CircularShrinkGrowLoaderState extends State<CircularShrinkGrowLoader>
    with TickerProviderStateMixin {
  // Each Line for 250 ms total 2000 millis
  static const _delayInMills = [
    250,
    500,
    750,
    1000,
    1250,
    1500,
    1750,
    2000,
  ];

  static const _durationInMills = 2000;

  final List<AnimationController> _sizeAnimationControllers = [];
  final List<Animation<double>> _sizeAnimations = [];

  /// Setting up a Controller for each hand
  /// Repeating the animation at a certain delay
  /// TweenSequence help to bring Shrink and Grow Effect
  @override
  void initState() {
    for (int i = 0; i < _linesSize; i++) {
      _sizeAnimationControllers.add(
        AnimationController(
          value: _delayInMills[i] / _durationInMills,
          vsync: this,
          duration: const Duration(milliseconds: _durationInMills),
        ),
      );
      _sizeAnimations.add(
        TweenSequence([
          TweenSequenceItem(
            tween: Tween(begin: 1.0, end: 0.3),
            weight: 1,
          ),
          TweenSequenceItem(
            tween: Tween(begin: 0.3, end: 1.0),
            weight: 1,
          ),
        ]).animate(
          CurvedAnimation(
              parent: _sizeAnimationControllers[i],
              curve: Curves.fastOutSlowIn),
        ),
      );

      _sizeAnimationControllers[i].repeat();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      final circleSize = constraint.maxWidth / 14;

      final widgets = List<Widget>.filled(_linesSize, const SizedBox.shrink());
      for (int i = 0; i < widgets.length; i++) {
        // -ve to make it clock wise
        final angle = pi * (-i / 4);
        widgets[i] = AnimatedBuilder(
          animation: _sizeAnimations[i],
          builder: (context, child) {
            return ScaleTransition(
              scale: _sizeAnimations[i],
              child: CustomPaint(
                size: Size(circleSize, circleSize),
                painter: LoadingHandPainter(
                  heightAnimationValue: _sizeAnimations[i].value,
                  angle: angle,
                ),
              ),
            );
          },
        );

        // This is working somehow as expected
      }
      return Center(
        child: Stack(
          alignment: Alignment.center,
          children: widgets,
        ),
      );
    });
  }

  @override
  void dispose() {
    for (var controller in _sizeAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

/// Custom Animate Widget to Handle the SizeTransition
class ScaleFromTopTransition extends AnimatedWidget {
  const ScaleFromTopTransition({
    super.key,
    required this.newAngle,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;
  final double newAngle;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.topCenter,
      child: CustomPaint(
        size: const Size(100, 100),
        painter: LoadingHandPainter(
          heightAnimationValue: _progress.value,
          angle: newAngle,
        ),
      ),
    );
  }
}

/// Custom Painter
/// Draw each respective hands for the loader
/// Responsible for updating the height value
class LoadingHandPainter extends CustomPainter {
  final double heightAnimationValue;
  final double angle;

  const LoadingHandPainter({
    required this.heightAnimationValue,
    required this.angle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double height = size.width * 0.4;

    final Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final double startX = radius + (radius - 8) * cos(angle);
    final double startY = radius + (radius - 8) * sin(angle);
    final double endX =
        radius + (radius - (heightAnimationValue * height)) * cos(angle);
    final double endY =
        radius + (radius - (heightAnimationValue * height)) * sin(angle);

    canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
