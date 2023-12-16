import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// Todo : Make Text Bold
class AnimatedTitleSlide extends StatelessWidget {
  const AnimatedTitleSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: width,
              height: height,
              color: Colors.amber.shade200,
              child: const SizedBox(),
            ),
            SizedBox(
              width: width * 0.5,
              height: height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Understanding',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 54),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'Animation',
                        textStyle: const TextStyle(
                          color: Colors.blue,
                          fontSize: 48,
                        ),
                      ),
                    ],
                    repeatForever: true,
                  ),
                  const Text(
                    'APIs',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 54),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
