import 'package:flutter/material.dart';

class TestExplicit extends StatefulWidget {
  const TestExplicit({super.key});

  @override
  State<TestExplicit> createState() => _TestExplicitState();
}

class _TestExplicitState extends State<TestExplicit>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _animationController.forward();
                  },
                  child: const Text('Forward')),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    _animationController.reverse();
                  },
                  child: const Text('Reverse')),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _animationController.reset();
                },
                child: const Text('Reset'),
              ),
              const SizedBox(height: 16),
              Slider(
                  value: _animation.value,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {})
            ],
          ),
        );
      },
    );
  }
}
