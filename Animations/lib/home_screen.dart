import 'package:animations/close/thank_you.dart';
import 'package:animations/explicit/bat_signal_animation.dart';
import 'package:animations/implicit/implicit_custom_example.dart';
import 'package:animations/intro/animated_title_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'intro/animation_types.dart';

/// First Widget of the Application
/// Act as a Starting Point
/// Contains PageViewer, which is controlled by
/// arrow keys
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
          children: const <Widget>[
            AnimatedTitleSlide(),
            AnimationTypesSlide(),
            ImplicitCustomExample(),
            BatSignalExplicitAnimation(),
            ThankYouSlide(),
          ],
        ),
      ),
    );
  }
}
