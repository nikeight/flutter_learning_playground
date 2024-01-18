import 'dart:ui';
import 'package:flutter/animation.dart' show Tween;
import 'package:themes/theme/custome_color_modal.dart';

class CustomColorTween extends Tween<CustomColorModal> {
  final CustomColorModal lastColorScheme;
  final CustomColorModal newColorScheme;

  CustomColorTween({
    required this.lastColorScheme,
    required this.newColorScheme,
  }) : super(begin: newColorScheme, end: newColorScheme);

  @override
  CustomColorModal lerp(double t) {
    return CustomColorModal(
      brand50: Color.lerp(lastColorScheme.brand50, newColorScheme.brand50, t) ??
          const Color(0x00ffffff),
      brand100:
          Color.lerp(lastColorScheme.brand100, newColorScheme.brand100, t) ??
              const Color(0x00ffffff),
    );
  }
}
