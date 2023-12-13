import 'package:flutter/material.dart';

class BatmanCutOut extends StatefulWidget {
  const BatmanCutOut({super.key});

  @override
  State<BatmanCutOut> createState() => _BatmanCutOutState();
}

class _BatmanCutOutState extends State<BatmanCutOut> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: OvalLightForeground(),
        child: const SizedBox(
          width: 300,
          height: 150,
        ),
      ),
    );
  }
}

class BatmanLogo extends CustomPainter {
  const BatmanLogo();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final path = Path()
      ..moveTo(100, 100)
      ..quadraticBezierTo(80, 60, 20, 40)
      ..quadraticBezierTo(50, 20, 0, 0)
      ..lineTo(50, 0)
      ..quadraticBezierTo(75, 20, 80, 30)
      ..lineTo(90, 00)
      ..quadraticBezierTo(100, 20, 110, 0)
      ..lineTo(120, 30)
      ..quadraticBezierTo(125, 20, 150, 00)
      ..lineTo(200, 0)
      ..quadraticBezierTo(150, 20, 180, 40)
      ..quadraticBezierTo(120, 60, 100, 100)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class OvalLightForeground extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    var rectangle = Rect.fromCenter(center: center, width: 300.0, height: 200.0);

    final paint = Paint()
      ..color = Colors.white60..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15.0);

    canvas.drawOval(rectangle, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
