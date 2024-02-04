import 'package:flutter/material.dart';

class ImplicitApproach extends StatefulWidget {
  const ImplicitApproach({super.key});

  @override
  State<ImplicitApproach> createState() => _ImplicitApproachState();
}

class _ImplicitApproachState extends State<ImplicitApproach> {
  ThemeMode currentThemeMode = ThemeMode.light;
  final lightColor = Colors.yellow;
  final darkColor = Colors.blueGrey;
  late Color beginColor;
  late Color endColorVariable;

  @override
  void initState() {
    beginColor = currentThemeMode == ThemeMode.light ? darkColor : lightColor;
    endColorVariable =
        currentThemeMode == ThemeMode.light ? lightColor : darkColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: ColorTween(begin: beginColor, end: endColorVariable),
      duration: const Duration(seconds: 1, milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
      builder: (context, theme, widget) {
        print('REBUILT BUILDER');
        return Scaffold(
          backgroundColor: theme,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  'Light',
                  style: TextStyle(color: theme),
                ),
                leading: Radio<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: currentThemeMode,
                  onChanged: (ThemeMode? value) {
                    setState(
                      () {
                        currentThemeMode = value!;
                        endColorVariable = lightColor;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: Text('Dark', style: TextStyle(color: theme)),
                leading: Radio<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: currentThemeMode,
                  onChanged: (ThemeMode? value) {
                    setState(
                      () {
                        currentThemeMode = value!;
                        endColorVariable = darkColor;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                color: theme,
                width: 100,
                height: 100,
                child: const Center(
                  child: Text('Animated Container'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
