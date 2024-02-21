import 'package:flutter/material.dart';

// TODO(Niket): provide the implementation.
class ImplicitAnimateSwitcher extends StatefulWidget {
  const ImplicitAnimateSwitcher({super.key});

  @override
  State<ImplicitAnimateSwitcher> createState() =>
      _ImplicitAnimateSwitcherState();
}

class _ImplicitAnimateSwitcherState extends State<ImplicitAnimateSwitcher> {

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
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('Change Size'),
          ),
        ],
      ),
    );
  }
}
