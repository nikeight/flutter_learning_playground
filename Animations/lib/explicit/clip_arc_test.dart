import 'package:flutter/material.dart';

class SpotlightClipTesting extends StatelessWidget {
  const SpotlightClipTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const SpotlightClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class SpotlightClipper extends CustomClipper<Path>{
  const SpotlightClipper();
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

  @override
  Path getClip(Size size) {
    final path = Path(); 

    // Moving to the Building
    path.lineTo(size.width * 0.2, size.height / 2.5);

    // Right Top point
    path.lineTo(size.width * 0.7, size.height / 14);

    // Right Bottom Point
    path.lineTo(size.width * 0.8, size.height / 4);

    // Center Again
    path.lineTo(size.width * 0.2, size.height / 2.5);
    
    return path;
  }}