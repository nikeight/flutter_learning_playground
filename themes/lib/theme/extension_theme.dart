import 'package:flutter/material.dart';
import 'package:themes/theme/custom_colors.dart';
import 'package:themes/theme/custome_color_modal.dart';

extension CustomColorScheme on BuildContext {
  CustomColorModal get currentThemeMode {
    CustomColorModal lightColorScheme = CustomColorModal(
      brand50: CustomColors.color1Light,
      brand100: CustomColors.color2Light,
    );

    CustomColorModal darkColorScheme = CustomColorModal(
      brand50: CustomColors.color1Dark,
      brand100: CustomColors.color2Dark,
    );

    return MediaQuery.of(this).platformBrightness == Brightness.light
        ? lightColorScheme
        : darkColorScheme;
  }
}
