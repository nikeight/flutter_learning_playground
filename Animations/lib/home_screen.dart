import 'package:animations/close/thank_you.dart';
import 'package:animations/explicit/bat_signal_animation.dart';
import 'package:animations/explicit/circular_color_picker.dart';
import 'package:animations/implicit/implicit_custom_example.dart';
import 'package:animations/intro/animated_title_slide.dart';
import 'package:flutter/cupertino.dart';
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
          children: <Widget>[
            ListView.builder(
              itemCount: 10,
              itemBuilder: (_, __) {
                return const Column(
                  children: [
                    TestingTextOverflow(),
                  ],
                );
              },
            ),
            Center(
              child: HueColorPicker(
                onColorSelected: (color) {
                  print("Selected color: $color");
                },
              ),
            ),
            const AnimatedTitleSlide(),
            const AnimationTypesSlide(),
            const ImplicitCustomExample(),
            const BatSignalExplicitAnimation(),
            const ThankYouSlide(),
          ],
        ),
      ),
    );
  }
}

class TestingTextOverflow extends StatelessWidget {
  const TestingTextOverflow({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          const Flexible(
            child: Text(
              'hkahdahdahhdhaldhalhdlahdlahdlahdlhalhdlahdalhdladhladahldhlahd',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w300),
              maxLines: 1,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
