import 'package:animations/explicit/explicit_built_in.dart';
import 'package:flutter/material.dart';

/// Performance tips
/// Create the Controller in the Init State to avoid creating Controller multiple times
/// Also Dispose method is necessary to avoid any Memory leakage
class ExplicitExample extends StatelessWidget {
  const ExplicitExample({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explicit Animation',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.normal,
            fontSize: 36,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Text(
              '⦿ Repeat Animation',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Steps/Stages based ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Controlled by Developers, Through AnimationController',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⦿ Built under AnimatedBuilder',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⭐️ Takes Animation<Double> type values',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '⭐️ Support FooTransition ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const ExplicitBuiltInApiListScreen(),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      child: const Text(
                        'Built-In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      child: const Text(
                        'Custom',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
