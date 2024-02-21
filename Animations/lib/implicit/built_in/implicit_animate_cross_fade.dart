import 'package:flutter/material.dart';

class ImplicitAnimateCrossFade extends StatefulWidget {
  const ImplicitAnimateCrossFade({super.key});

  @override
  State<ImplicitAnimateCrossFade> createState() =>
      _ImplicitAnimateCrossFadeState();
}

class _ImplicitAnimateCrossFadeState extends State<ImplicitAnimateCrossFade> {
  bool showBatman = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedCrossFade(
              firstChild: firstWidget(),
              secondChild: secondWidget(),
              duration: const Duration(seconds: 1, milliseconds: 500),
              firstCurve: Curves.fastOutSlowIn,
              secondCurve: Curves.fastEaseInToSlowEaseOut,
              crossFadeState: showBatman
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showBatman = !showBatman;
              });
            },
            child: Text(showBatman ? 'Show Flash' : 'Show Batman'),
          ),
        ],
      ),
    );
  }

  Widget firstWidget() => Image.asset(
        'assets/image/flash_logo.png',
        width: 250,
        height: 250,
      );

  Widget secondWidget() => Image.asset(
        'assets/image/batman_logo.png',
        width: 250,
        height: 250,
      );
}
