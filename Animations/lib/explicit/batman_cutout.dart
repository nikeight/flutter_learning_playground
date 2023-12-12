import 'package:flutter/material.dart';

class BatmanCutOut extends StatefulWidget {
  const BatmanCutOut({super.key});

  @override
  State<BatmanCutOut> createState() => _BatmanCutOutState();
}

class _BatmanCutOutState extends State<BatmanCutOut> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  CustomPaint(
        painter: BatmanLogo(),
        child: SizedBox(
          width: 250,
          height: 250,
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
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path()
      ..moveTo(size.width / 2, size.height)
      ..lineTo(-75, -75)
      ..lineTo(0, size.height / 2)
      ..lineTo(-75, 75)
      ..lineTo(size.width / 2, 0)
      ..lineTo(75, 75)
      ..lineTo(size.width / 2, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
