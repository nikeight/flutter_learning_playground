import 'package:flutter/material.dart';

class CustomExplicitSlide extends StatelessWidget {
  const CustomExplicitSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom Explicit Animation',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.normal,
            fontSize: 36,
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              '-- Animation Properties --',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '⦿ Linear Gradient',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '⦿ Custom Shape',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '⦿ Opacity ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 40),
            Text(
              '-- API Used -- ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Custom Clipper',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Custom Painter',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Animation Controller',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
