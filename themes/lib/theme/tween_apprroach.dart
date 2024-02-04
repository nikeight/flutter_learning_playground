import 'package:flutter/material.dart';
import 'package:themes/theme/CustomColorTween.dart';
import 'package:themes/theme/custome_color_modal.dart';
import 'package:themes/theme/extension_theme.dart';

class TweenThemes extends StatefulWidget {
  const TweenThemes({super.key});

  @override
  State<TweenThemes> createState() => _TweenThemesState();
}

class _TweenThemesState extends State<TweenThemes> {
  /// Create three Themes
  /// Default System One
  /// Light Theme
  /// Dark Theme
  /// Create a enum to maintain it
  /// via controlling it with setState()
  ThemeMode currentThemeMode = ThemeMode.light;
  late CustomColorModal beginColor;
  late CustomColorModal endColorVariable;

  @override
  void initState() {
    beginColor =
        currentThemeMode == ThemeMode.light ? darkColorModal : lightColorModal;
    endColorVariable =
        currentThemeMode == ThemeMode.light ? lightColorModal : darkColorModal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: CustomColorTween(
            lastColorScheme: beginColor, newColorScheme: endColorVariable),
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
        builder: (context, theme, widget) {
          return Scaffold(
            backgroundColor: theme.brand100,
            appBar: AppBar(
              backgroundColor: theme.brand50,
              title: Text(
                'Theme POC',
                style: TextStyle(color: theme.textColor),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ListTile(
                //   title: const Text('System Theme'),
                //   leading: Radio<CustomThemeMode>(
                //     value: CustomThemeMode.systemTheme,
                //     groupValue: _currentSelectedTheme,
                //     onChanged: (CustomThemeMode? value) {
                //       setState(
                //         () {
                //           _currentSelectedTheme = value;
                //           _animation = context.isDarkMode()
                //               ? lightToDarkTheme.animate(CurvedAnimation(
                //                   parent: _animationController,
                //                   curve: Curves.linear))
                //               : darkToLightTheme.animate(CurvedAnimation(
                //                   parent: _animationController,
                //                   curve: Curves.linear));
                //           _animationController.forward();
                //           Future.delayed(const Duration(milliseconds: 500))
                //               .then((value) => _animationController.reset());
                //         },
                //       );
                //     },
                //   ),
                // ),
                ListTile(
                  title: const Text('Light'),
                  leading: Radio<ThemeMode>(
                    value: ThemeMode.light,
                    groupValue: currentThemeMode,
                    onChanged: (ThemeMode? value) {
                      setState(
                        () {
                          currentThemeMode = value!;
                          endColorVariable = lightColorModal;
                        },
                      );
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Dark'),
                  leading: Radio<ThemeMode>(
                    value: ThemeMode.dark,
                    groupValue: currentThemeMode,
                    onChanged: (ThemeMode? value) {
                      setState(
                        () {
                          currentThemeMode = value!;
                          endColorVariable = darkColorModal;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Card(
                  color: theme.brand50,
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
                            color: theme.textColor,
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
                            color: theme.textColor,
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
                              color: theme.textColor,
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
        });
  }
}
