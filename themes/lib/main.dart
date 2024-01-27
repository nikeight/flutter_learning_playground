import 'package:flutter/material.dart';
import 'package:themes/theme/CustomColorTween.dart';
import 'package:themes/theme/custome_color_modal.dart';
import 'package:themes/theme/extension_theme.dart';
import 'package:themes/theme/theme_mode_enum.dart';

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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text('System Theme'),
                  leading: Radio<CustomThemeMode>(
                    value: CustomThemeMode.systemTheme,
                    groupValue: _currentSelectedTheme,
                    onChanged: (CustomThemeMode? value) {
                      setState(
                        () {
                          _currentSelectedTheme = value;
                          _animation = context.isDarkMode()
                              ? lightToDarkTheme.animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.linear))
                              : darkToLightTheme.animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.linear));
                          _animationController.forward();
                          Future.delayed(const Duration(milliseconds: 500))
                              .then((value) => _animationController.reset());
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Light'),
                  leading: Radio<CustomThemeMode>(
                    value: CustomThemeMode.lightTheme,
                    groupValue: _currentSelectedTheme,
                    onChanged: (CustomThemeMode? value) {
                      setState(() {
                        _currentSelectedTheme = value;
                        if (!context.isDarkMode()) {
                          _animation = darkToLightTheme.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.linear));
                          _animationController.forward();
                          Future.delayed(const Duration(milliseconds: 500))
                              .then((value) => _animationController.reset());
                        }
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Dark'),
                  leading: Radio<CustomThemeMode>(
                    value: CustomThemeMode.darkTheme,
                    groupValue: _currentSelectedTheme,
                    onChanged: (CustomThemeMode? value) {
                      setState(
                        () {
                          _currentSelectedTheme =
                              value ?? CustomThemeMode.systemTheme;
                          if (context.isDarkMode()) {
                            _animation = lightToDarkTheme.animate(
                                CurvedAnimation(
                                    parent: _animationController,
                                    curve: Curves.linear));
                            _animationController.forward();
                            Future.delayed(const Duration(milliseconds: 500))
                                .then((value) => _animationController.reset());
                          }
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Card(
                  color: _animation.value.brand50,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          'Text Heading',
                          style: TextStyle(
                            color: _animation.value.textColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Text(
                          'This is a long string value to act as a body text value,generally contains the details of a action',
                          style: TextStyle(
                            color: _animation.value.textColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            // Does nothing
                          },
                          child: Text(
                            'Action Button',
                            style: TextStyle(
                              color: _animation.value.textColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
