import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageViewController = PageController();
    return CallbackShortcuts(
      bindings:  <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          pageViewController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn
          );
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          pageViewController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn
          );
        },
      },
      child: Focus(
        autofocus: true,
        child: PageView(
          controller: pageViewController,
          children: const <Widget>[
            Center(
              child: Text('First Page'),
            ),
            Center(
              child: Text('Second Page'),
            ),
            Center(
              child: Text('Third Page'),
            ),
          ],
        ),
      ),
    );
  }
}
