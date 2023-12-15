import 'package:flutter/material.dart';

// Todo : Give Image a Circular Border
// Todo : Bold Text
// If Possible add some animations
class IntroductionSlide extends StatelessWidget {
  const IntroductionSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.amber.shade200,
            child: const SizedBox(),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/profile_pic_github.jpg',
                  width: width * 0.45,
                  height: height * 0.90,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Niket Jain',
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      '➡ Android Engineer \n     at Mutual Mobile',
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      '➡ GDG Bhilai Core Member',
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      '➡ Open Source Contributor',
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      '➡ Patzer ♟️',
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
