import 'package:flutter/material.dart';

class ImplicitAnimateTheme extends StatefulWidget {
  const ImplicitAnimateTheme({super.key});

  @override
  State<ImplicitAnimateTheme> createState() => _ImplicitAnimateThemeState();
}

class _ImplicitAnimateThemeState extends State<ImplicitAnimateTheme> {
  bool isThemeLight = true;
  ThemeData lightThemeData = ThemeData(
    primaryColor: Colors.yellow,
  );

  ThemeData darkThemeData = ThemeData(
    primaryColor: Colors.purpleAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedTheme(
              duration: const Duration(milliseconds: 1500),
              onEnd: () {
                print('On End Called');
              },
              curve: Curves.easeInOut,
              data: isThemeLight ? lightThemeData : darkThemeData,
              child: Center(
                child: Card(
                  margin: const EdgeInsets.all(24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'This is the Header',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'This is the sub-heading',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  isThemeLight = !isThemeLight;
                },
              );
            },
            child: const Text('Change Theme'),
          ),
        ],
      ),
    );
  }
}
