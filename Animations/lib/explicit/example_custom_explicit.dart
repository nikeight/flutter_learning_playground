import 'package:animations/explicit/batman_cutout.dart';
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
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: const [
                      Colors.white,
                      Colors.transparent,
                    ],
                    stops: [0, _beamAnimationController.value],
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.6,
          top: MediaQuery.of(context).size.height * 0.05,
          child: Stack(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateZ(-15),
                child: CustomPaint(
                  painter: OvalLightForeground(),
                  child: const SizedBox(
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateZ(1),
                child: const CustomPaint(
                  painter: BatmanLogo(),
                  child: SizedBox(
                    width: 200,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   left: MediaQuery.of(context).size.width * 0.6,
        //   top: MediaQuery.of(context).size.height * 0.05,
        //   child: Transform(
        //     alignment: Alignment.center,
        //     transform: Matrix4.identity()..rotateZ(1),
        //     child: const CustomPaint(
        //       painter: BatmanLogo(),
        //       child: SizedBox(
        //         width: 200,
        //         height: 100,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
