import 'package:flutter/material.dart';

class ThankYouSlide extends StatelessWidget {
  const ThankYouSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow.shade300,
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text(
              'Thank You',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Twitter : nikeight_',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Github : nikeight',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24)
          ],
        )),
      ),
    );
  }
}
