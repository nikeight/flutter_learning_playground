import 'package:flutter/material.dart';
import 'package:themes/theme/custom_colors.dart';
import 'package:themes/theme/custome_color_modal.dart';

extension ColorScheme on BuildContext {
  bool isDarkMode() {
    // Access the MediaQueryData to check the brightness of the device
    final brightness = MediaQuery.of(this).platformBrightness;

    // Return true if the device is in dark mode
    return brightness == Brightness.dark;
  }

  CustomColorModal get emberColorScheme =>
      isDarkMode() ? darkColorModal : lightColorModal;
}

CustomColorModal darkColorModal = CustomColorModal(
    brand50: CustomColors.color1Dark, brand100: CustomColors.color2Dark,textColor: CustomColors.onDarkText);

CustomColorModal lightColorModal = CustomColorModal(
    brand50: CustomColors.color1Light, brand100: CustomColors.color2Light,textColor: CustomColors.onLightText);
