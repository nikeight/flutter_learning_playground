import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class GradientEllipse extends StatefulWidget {
  const GradientEllipse({super.key});

  @override
  State<GradientEllipse> createState() => _GradientEllipseState();
}

class _GradientEllipseState extends State<GradientEllipse>
    with SingleTickerProviderStateMixin {
  List<List<int>> opacityLevelList = [
    [100, 30, 5, 5],
    [30, 100, 30, 5],
    [5, 30, 100, 30],
    [5, 5, 30, 100],
    [0, 5, 5, 30],
    [0, 0, 0, 5],
  ];

  late final AnimationController _animationController;
  late final Animation<int> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    _animation = IntTween(begin: 0, end: 5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, animationValue) {
        return Center(
          child: Container(
            color: Colors.white30,
            child: CustomPaint(
              size: const Size(400, 400),
              painter: GradientSemiCirclePainter(
                  opacityLevelList: opacityLevelList[_animation.value]),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class GradientSemiCirclePainter extends CustomPainter {
  GradientSemiCirclePainter({required this.opacityLevelList});

  final List<int> opacityLevelList;

  @override
  void paint(Canvas canvas, Size size) {
    final TextPainter textPainter = TextPainter(
      text: const TextSpan(
        text: 'Searching',
        style: TextStyle(
          fontSize: 20,
          color: Colors.orangeAccent,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    canvas.drawSemiCircle(size.width, size.height, opacityLevelList[3], 0);
    canvas.drawSemiCircle(size.width, size.height, opacityLevelList[2], 40);
    canvas.drawSemiCircle(size.width, size.height, opacityLevelList[1], 70);
    canvas.drawSemiCircle(size.width, size.height, opacityLevelList[0], 100);
    textPainter.paint(
      canvas,
      Offset(
        size.width / 2 - 50,
        size.height / 2 - 40,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant GradientSemiCirclePainter oldDelegate) {
    return oldDelegate.opacityLevelList != opacityLevelList;
  }
}

extension SemiCircleRadiator on Canvas {
  void drawSemiCircle(
    double rectWidth,
    double rectHeight,
    int opacityPercentage,
    int gapFactor,
  ) {
    const Gradient linearGradientOverRect = LinearGradient(
      colors: [
        Colors.white,
        Colors.orange,
        Colors.orange,
        Colors.orange,
        Colors.orange,
        Colors.orange,
        Colors.white,
      ],
    );

    final halfWidth = rectWidth / 2;
    final halfHeight = rectHeight / 2;

    final Rect semiRect = Rect.fromCenter(
      center: Offset(halfWidth, halfHeight), // Gives Center when div by 2.
      width: rectWidth - gapFactor,
      height: rectHeight - gapFactor,
    );

    final opacityValue = 1.0 * (opacityPercentage / 100);
    final Paint arcPaint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.orangeAccent.withOpacity(opacityValue)
      ..shader = linearGradientOverRect.createShader(semiRect);

    drawArc(
      semiRect,
      -pi, // start angle (in radians)
      pi, // sweep angle (in radians) to draw semi-circle
      false, // use center
      arcPaint,
    );
  }
}
