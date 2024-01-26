import 'package:flutter/material.dart';
import 'package:themes/theme/CustomColorTween.dart';
import 'package:themes/theme/custome_color_modal.dart';
import 'package:themes/theme/extension_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool _isDarkModeEnable = false;

  // Light theme
  final lightTheme = lightColorModal;

  final darkTheme = darkColorModal;

  late AnimationController _animationController;
  late Animation<CustomColorModal> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
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
    CustomColorTween customTween = context.isDarkMode()
        ? CustomColorTween(
            lastColorScheme: darkTheme,
            newColorScheme: lightTheme,
          )
        : CustomColorTween(
            lastColorScheme: lightTheme,
            newColorScheme: darkTheme,
          );

    _animation = customTween.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));

    bool moveToForwardAnimation(
        {bool isDarkTheme = false, bool switchOn = false}) {
      if ((!isDarkTheme && !switchOn) || (isDarkTheme && switchOn)) {
        return true;
      } else {
        return false;
      }
    }

    return MaterialApp(
      title: 'Flutter Demo',
      home: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: _animation.value.brand100,
            appBar: AppBar(
              backgroundColor: _animation.value.brand50,
              title: Text(
                'Theme POC',
                style: TextStyle(color: _animation.value.textColor),
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
                    onChanged: (switchValue) {
                      setState(() {
                        _isDarkModeEnable = switchValue;
                        if (switchValue) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      });
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
