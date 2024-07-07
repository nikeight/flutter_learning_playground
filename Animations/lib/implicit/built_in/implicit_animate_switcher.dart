import 'dart:math';

import 'package:flutter/material.dart';

// TODO : Find a good idea for animate Switcher
class ImplicitAnimateSwitcher extends StatefulWidget {
  const ImplicitAnimateSwitcher({super.key});

  @override
  State<ImplicitAnimateSwitcher> createState() => _ImplicitAnimateSwitcherState();
}

class _ImplicitAnimateSwitcherState extends State<ImplicitAnimateSwitcher> {
  double childSize = 50.0;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 5),
              child: Image.asset(
                'assets/image/flash_logo.png',
                width: childSize,
                height: childSize,
              ),
              transitionBuilder: (_,__){
                return Text('');
              },
              layoutBuilder: (_,__){
                return Text('');
              },

            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                childSize = random.nextInt(500).toDouble();
              });
            },
            child: const Text('Change Size'),
          ),
        ],
      ),
    );
  }
}
