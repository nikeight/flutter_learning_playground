import 'package:flutter/material.dart';
import 'package:themes/doubble_value_example.dart';
import 'package:themes/theme/CustomColorTween.dart';
import 'package:themes/theme/custom_colors.dart';
import 'package:themes/theme/custome_color_modal.dart';

void main() {
  runApp(const DoubleValueExample());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool _isDarkModeEnable = false;
  CustomColorModal currentCustomColorModal = CustomColorModal(
    brand50: CustomColors.color1Light,
    brand100: CustomColors.color2Light,
  );

  // Light theme
  final lightTheme = CustomColorModal(
    brand50: CustomColors.color1Light,
    brand100: CustomColors.color2Light,
  );

  final darkTheme = CustomColorModal(
    brand50: CustomColors.color1Dark,
    brand100: CustomColors.color2Dark,
  );

  late AnimationController _animationController;
  late Animation<CustomColorModal> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    CustomColorTween customTween = CustomColorTween(
      lastColorScheme: lightTheme,
      newColorScheme: darkTheme,
    );

    _animation = customTween.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastEaseInToSlowEaseOut));

    _animation.addListener(() {
      currentCustomColorModal = _animation.value;
      print("Current Color Vale : ${_animation.value.brand100}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If the Current Theme is White
    // Keep last Color Scheme as for Light Theme ( begin Value )
    // else last Color Scheme as for Dark Theme ( begin Value )
    CustomColorModal lastColorScheme =
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? lightTheme
            : darkTheme;

    // If the Current Theme is White
    // Keep new Color Scheme as for Dark Theme ( end Value )
    // else new Color Scheme as for Dark Theme ( end Value )
    CustomColorModal newColorScheme =
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? darkTheme
            : lightTheme;

    void updateTheme(bool value) {
      setState(() {
        _isDarkModeEnable = value;
        if (value) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      });
    }

    return MaterialApp(
      title: 'Flutter Demo',
      home: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: _animation.value.brand100,
            appBar: AppBar(
              title: Text(
                'Theme POC',
                style: TextStyle(color: _animation.value.brand100),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'This is a demo Text',
                    style: TextStyle(
                      fontSize: 32,
                      color: _animation.value.brand50,
                    ),
                  ),
                  Switch(
                    value: _isDarkModeEnable,
                    onChanged: updateTheme,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
