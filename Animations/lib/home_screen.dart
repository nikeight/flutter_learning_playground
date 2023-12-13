import 'package:animations/explicit/example_custom_explicit.dart';
import 'package:animations/explicit/example_explicit.dart';
import 'package:animations/hero/example_hero_animation.dart';
import 'package:animations/implicit/example_custom_implicit.dart';
import 'package:animations/implicit/example_implicit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'explicit/batman_cutout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageViewController = PageController();
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          pageViewController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          pageViewController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn);
        },
      },
      child: Focus(
        autofocus: true,
        child: PageView(
          controller: pageViewController,
          children: <Widget>[
            HeroAnimation(),
            const Center(
              child: Text('First Page'),
            ),
            const ImplicitExample(),
            const CustomImplicitExample(),
            const ExplicitExample(),
            const CustomExplicit(),
            const BatmanCutOut(),
          ],
        ),
      ),
    );
  }
}
