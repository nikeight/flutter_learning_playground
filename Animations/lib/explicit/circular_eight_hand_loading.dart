import 'dart:math';

import 'package:flutter/material.dart';

class CircularLoaderWithEightHands extends StatefulWidget {
  const CircularLoaderWithEightHands({super.key});

  @override
  State<CircularLoaderWithEightHands> createState() =>
      _CircularLoaderWithEightHandsState();
}

const int _linesSize = 8;

class _CircularLoaderWithEightHandsState
    extends State<CircularLoaderWithEightHands>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotateController;
  late final Animation<double> _rotateAnimation;

  @override
  void initState() {
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    _rotateAnimation = Tween(begin: 0.0, end: 2.0 * pi).animate(
      CurvedAnimation(
        parent: _rotateController,
        curve: Curves.linear,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      final widgets = List<Widget>.filled(_linesSize, const SizedBox.shrink());
      for (int i = 0; i < widgets.length; i++) {
        // -ve to make it clock wise
        final angle = pi * (-i / 4);
        widgets[i] = CustomPaint(
          size: const Size(48, 48),
          painter: LoaderHandPainter(angle),
        );

        // This is working somehow as expected
      }
      return Center(
        child: AnimatedBuilder(
          animation: _rotateAnimation,
          builder: (context, child) {
            return RotationTransition(
              turns: _rotateAnimation,
              child: Stack(
                alignment: Alignment.center,
                children: widgets,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }
}

class LoaderHandPainter extends CustomPainter {
  const LoaderHandPainter(this.specificAngle);

  final double specificAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final double height = radius / 1.85;

    final Paint paint = Paint()
      ..color = const Color(0xFF66625F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final double startX = radius - (radius * cos(specificAngle));
    final double startY = radius - (radius * sin(specificAngle));
    final double endX = radius - (radius - height) * cos(specificAngle);
    final double endY = radius - (radius - height) * sin(specificAngle);

    canvas.drawLine(
      Offset(startX, startY),
      Offset(endX, endY),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
