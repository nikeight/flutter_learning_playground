import 'package:animations/explicit/example_explicit.dart';
import 'package:animations/hero/example_hero_animation.dart';
import 'package:animations/implicit/implicit_intro.dart';
import 'package:animations/navigation/example_navigation_screen.dart';
import 'package:flutter/material.dart';

/// Contains the Grid View
/// as a different options for various animations
class AnimationTypesSlide extends StatelessWidget {
  const AnimationTypesSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Types'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.amber.shade200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ImplicitIntro(),
                        ),
                      );
                    },
                    child: Container(
                      width: width * 0.3,
                      height: height * 0.3,
                      color: Colors.purple.shade500,
                      child: const Center(
                        child: Text(
                          'Implicit',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 54),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ExplicitExample(),
                        ),
                      );
                    },
                    child: Container(
                      width: width * 0.3,
                      height: height * 0.3,
                      color: Colors.blue.shade600,
                      child: const Center(
                        child: Text(
                          'Explicit',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NavigationExampleScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: width * 0.3,
                      height: height * 0.3,
                      color: Colors.blueGrey.shade600,
                      child: const Center(
                        child: Text(
                          'Navigation',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 54),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HeroAnimation(),
                        ),
                      );
                    },
                    child: Container(
                      width: width * 0.3,
                      height: height * 0.3,
                      color: Colors.green.shade600,
                      child: const Center(
                        child: Text(
                          'Hero',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 54),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
