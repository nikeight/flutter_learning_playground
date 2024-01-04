import 'package:animations/explicit/batman_painter.dart';
import 'package:animations/explicit/spotlight_clipper.dart';
import 'package:flutter/material.dart';

class BatSignalExplicitAnimation extends StatefulWidget {
  const BatSignalExplicitAnimation({super.key});

  @override
  State<BatSignalExplicitAnimation> createState() =>
      _BatSignalExplicitAnimationState();
}

class _BatSignalExplicitAnimationState extends State<BatSignalExplicitAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _beamAnimationController;
  late final Animation<double> _beamAnimation;
  double newOpacity = 0.0;

  @override
  void dispose() {
    _beamAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _beamAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..forward();

    _beamAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(
            parent: _beamAnimationController,
            curve: Curves.fastEaseInToSlowEaseOut,
        ),
    );

    // Calls the Build Method and update the opacity value
    _beamAnimationController.addListener(() {
      setState(() {
        newOpacity = _beamAnimationController.value * 0.7;
      });
    });

    _beamAnimationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 2));
        _beamAnimationController.reset();
        _beamAnimationController.forward();
      }
    });

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
          animation: _beamAnimation,
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
                      Colors.white60,
                      Colors.transparent,
                    ],
                    stops: [
                      _beamAnimation.value * 0.2,
                      _beamAnimation.value * 0.4,
                      _beamAnimation.value * 0.7
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.6,
          top: MediaQuery.of(context).size.height * 0.05,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(0.7),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: newOpacity,
                    child: const CustomPaint(
                      painter: OvalLightForeground(),
                      child: SizedBox(
                        width: 250,
                        height: 180,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 25,
                    child: Opacity(
                      opacity: newOpacity,
                      child: const CustomPaint(
                        painter: BatmanLogo(),
                        child: SizedBox(
                          width: 200,
                          height: 100,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
