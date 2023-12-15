import 'package:flutter/material.dart';

class TopicStartSlide extends StatelessWidget {
  const TopicStartSlide({super.key});

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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Animations?',
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 54),
                  ),
                  Text(
                    'Take Away?',
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 36),
                  ),
                  Text(
                    'Benefits?',
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 36),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
