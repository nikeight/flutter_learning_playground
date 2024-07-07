import 'dart:math';

import 'package:flutter/material.dart';

class HueColorPicker extends StatefulWidget {
  final Function(Color) onColorSelected;
  static const int colourCircleRadius = 20;

  const HueColorPicker({super.key, required this.onColorSelected});

  @override
  HueColorPickerState createState() => HueColorPickerState();
}

class HueColorPickerState extends State<HueColorPicker> {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.indigo,
    Colors.deepPurple,
    Colors.purple,
    Colors.pink,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.yellowAccent,
    Colors.lightGreenAccent
  ];

  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    // OnTapUp give support for Coordinates detail callback
    return GestureDetector(
      onTapUp: (details) {
        RenderBox renderBox = context.findRenderObject() as RenderBox;
        // Getting the tapped area OffSet
        Offset localPosition = renderBox.globalToLocal(details.globalPosition);

        // Calculating if only Colour Circle tapped
        for (int i = 0; i < colors.length; i++) {
          double centerX =
              renderBox.size.width / 2 + 100 * cos(i * 2 * pi / colors.length);
          double centerY =
              renderBox.size.height / 2 + 100 * sin(i * 2 * pi / colors.length);

          double dx = localPosition.dx - centerX;
          double dy = localPosition.dy - centerY;

          final distance = sqrt(dx * dx + dy * dy);

          if (distance <= HueColorPicker.colourCircleRadius) {
            setState(() {
              _selectedColorIndex = i;
            });
            // passing the selected color index,
            widget.onColorSelected(colors[i]);
          }
        }
      },
      child: CustomPaint(
        size: const Size(200, 200),
        painter: HueColorPickerPainter(colors, _selectedColorIndex),
      ),
    );
  }
}

class HueColorPickerPainter extends CustomPainter {
  final List<Color> colors;
  final int selectedColorIndex;

  HueColorPickerPainter(this.colors, this.selectedColorIndex);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint shadowPaint = Paint()
      ..color = Colors.white.withAlpha(70)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal,
          HueColorPicker.colourCircleRadius.toDouble() * 0.57735 + 0.5);

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    for (int i = 0; i < colors.length; i++) {
      double circleX = centerX + 100 * cos(i * 2 * pi / colors.length);
      double circleY = centerY + 100 * sin(i * 2 * pi / colors.length);

      // Draw circle
      paint.color = colors[i];
      canvas.drawCircle(
        Offset(circleX, circleY),
        HueColorPicker.colourCircleRadius.toDouble(),
        paint,
      );

      // Draw shadow if the circle is selected
      if (i == selectedColorIndex) {
        paint.color = Colors.black.withOpacity(0.3);
        canvas.drawCircle(
          Offset(circleX, circleY),
          HueColorPicker.colourCircleRadius.toDouble() + 4,
          i == selectedColorIndex ? shadowPaint : paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(HueColorPickerPainter oldDelegate) {
    return oldDelegate.selectedColorIndex != selectedColorIndex;
  }
}
