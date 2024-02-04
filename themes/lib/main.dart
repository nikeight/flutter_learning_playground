import 'package:flutter/material.dart';
import 'package:themes/theme/CustomColorTween.dart';
import 'package:themes/theme/custome_color_modal.dart';
import 'package:themes/theme/extension_theme.dart';
import 'package:themes/theme/implicit_approach.dart';
import 'package:themes/theme/theme_mode_enum.dart';
import 'package:themes/theme/tween_apprroach.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  CustomThemeMode? _currentSelectedTheme = CustomThemeMode.systemTheme;

  final lightTheme = lightColorModal;
  final darkTheme = darkColorModal;

  late AnimationController _animationController;
  late Animation<CustomColorModal> _animation;
  late CustomColorTween lightToDarkTheme;
  late CustomColorTween darkToLightTheme;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    lightToDarkTheme = CustomColorTween(
      lastColorScheme: darkTheme,
      newColorScheme: lightTheme,
    );

    darkToLightTheme = CustomColorTween(
      lastColorScheme: darkTheme,
      newColorScheme: lightTheme,
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animation = context.isDarkMode()
        ? lightToDarkTheme.animate(
            CurvedAnimation(parent: _animationController, curve: Curves.linear))
        : darkToLightTheme.animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));

    return const MaterialApp(
      title: 'Flutter Demo',
      home: TweenThemes(),
    );
  }
}
