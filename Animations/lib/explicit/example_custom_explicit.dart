import 'package:animations/explicit/clip_arc_test.dart';
import 'package:flutter/material.dart';

class CustomExplicit extends StatefulWidget {
  const CustomExplicit({super.key});

  @override
  State<CustomExplicit> createState() => _CustomExplicitState();
}

class _CustomExplicitState extends State<CustomExplicit>
    with SingleTickerProviderStateMixin {
  late final AnimationController _beamAnimationController;

  @override
  void dispose() {
    _beamAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _beamAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          'assets/image/gotha_city_ai.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        AnimatedBuilder(
          animation: _beamAnimationController,
          builder: (context, child) {
            return ClipPath(
              clipper: const SpotlightClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: const [
                      Colors.white,
                      Colors.white70,
                      Colors.white54,
                      Colors.transparent,
                    ],
                    stops: [
                      _beamAnimationController.value * 0.15,
                      _beamAnimationController.value * 0.25,
                      _beamAnimationController.value * 0.50,
                      _beamAnimationController.value
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
