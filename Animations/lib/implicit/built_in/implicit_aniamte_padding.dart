import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimatePadding extends StatefulWidget {
  const ImplicitAnimatePadding({super.key});

  @override
  State<ImplicitAnimatePadding> createState() => _ImplicitAnimatePaddingState();
}

class _ImplicitAnimatePaddingState extends State<ImplicitAnimatePadding> {
  double paddingValue = 10.0;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 4;
    final double itemWidth = size.width / 4;
    return Center(
      child: Stack(
        children: [
          GridView.count(
            crossAxisCount: 4,
            childAspectRatio: (itemWidth / itemHeight),
            children: List.generate(12, (index) {
              return AnimatedPadding(
                padding: EdgeInsets.all(paddingValue),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(seconds: 2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.yellow,
                    border: Border.all(
                      width: 3,
                      color: Colors.blueAccent,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        paddingValue = random.nextDouble() * 24;
                      },
                    );
                  },
                  child: const Text('Adjust padding')),
            ),
          )
        ],
      ),
    );
  }
}
