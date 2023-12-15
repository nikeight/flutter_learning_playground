import 'package:flutter/material.dart';

class ThankYouSlide extends StatelessWidget {
  const ThankYouSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width * 0.85;
    final imageHeight = MediaQuery.of(context).size.height * 0.85;
    return Scaffold(
      body: Center(
        child: Container(
            width: widthScreen,
            height: imageHeight,
            color: Colors.yellow.shade100,
            child: const Text('Thank You')),
      ),
    );
  }
}
