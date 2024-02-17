import 'package:flutter/material.dart';

class ImplicitAnimateText extends StatefulWidget {
  const ImplicitAnimateText({super.key});

  @override
  State<ImplicitAnimateText> createState() => _ImplicitAnimateTextState();
}

class _ImplicitAnimateTextState extends State<ImplicitAnimateText> {
  bool switchOn = false;
  Color _textColor = Colors.deepPurple;
  Color _textBgColor = Colors.white24;
  double _textFontSize = 24.0;
  FontWeight _textFontWeight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn,
            style: TextStyle(
              color: _textColor,
              backgroundColor: _textBgColor,
              fontSize: _textFontSize,
              fontWeight: _textFontWeight,
            ),
            child: Text(
              'Default Text Style',
              style: TextStyle(
                color: _textColor,
                backgroundColor: _textBgColor,
                fontSize: _textFontSize,
                fontWeight: _textFontWeight,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    switchOn = !switchOn;
                    _textColor = switchOn ? Colors.blue : Colors.deepPurple;
                    _textBgColor = switchOn ? Colors.white12 : Colors.white24;
                    _textFontSize = switchOn ? 36 : 24.0;
                    _textFontWeight =
                        switchOn ? FontWeight.bold : FontWeight.normal;
                  },
                );
              },
              child: const Text('Switch'))
        ],
      ),
    );
  }
}
