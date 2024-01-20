import 'package:flutter/material.dart';
import 'package:themes/theme/CustomColorTween.dart';
import 'package:themes/theme/custom_colors.dart';
import 'package:themes/theme/custome_color_modal.dart';

class DoubleValueExample extends StatefulWidget {
  const DoubleValueExample({super.key});

  @override
  State<DoubleValueExample> createState() => _DoubleValueExampleState();
}

class _DoubleValueExampleState extends State<DoubleValueExample>
    with SingleTickerProviderStateMixin {
  bool _isDarkModeEnable = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  // late Animation<CustomColorModal> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    CustomColorTween tween = CustomColorTween(
      lastColorScheme: CustomColorModal(
        brand50: CustomColors.color1Light,
        brand100: CustomColors.color2Light,
      ),
      newColorScheme: CustomColorModal(
        brand50: CustomColors.color1Dark,
        brand100: CustomColors.color2Dark,
      ),
    );

    _animation = Tween(begin: 50.0, end: 100.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animation.addListener(() {
      print("Current Color Vale : ${_animation.value}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Current Value : ${_animation.value}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black26,
                    ),
                  ),
                  Switch(
                    value: _isDarkModeEnable,
                    onChanged: (value) {
                      setState(() {
                        _isDarkModeEnable = !_isDarkModeEnable;
                      });
                      if (value) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    },
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
