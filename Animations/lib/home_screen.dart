import 'package:animations/close/thank_you.dart';
import 'package:animations/explicit/bat_signal_animation.dart';
import 'package:animations/explicit/custom_explicit_slide.dart';
import 'package:animations/explicit/example_explicit.dart';
import 'package:animations/hero/example_hero_animation.dart';
import 'package:animations/implicit/example_custom_implicit.dart';
import 'package:animations/implicit/example_implicit.dart';
import 'package:animations/intro/animated_title_slide.dart';
import 'package:animations/intro/api_list_slide.dart';
import 'package:animations/intro/introduction_slide.dart';
import 'package:animations/util/code_snippet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'explicit/batman_painter.dart';
import 'hero/team_card_view.dart';
import 'intro/animation_types.dart';
import 'intro/talk_start_slide.dart';
import 'navigation/example_navigation_screen.dart';

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
            const AnimatedTitleSlide(),
            const IntroductionSlide(),
            // const ApiListSlide(),
            const TopicStartSlide(),
            const AnimationTypesSlide(),
            const ImplicitExample(),
            const ShowCodeSnippetWidget(
              codeSnippetImageAsset: 'assets/snippets/implicit_example.png',
            ),
            const CustomImplicitExample(),
            const ShowCodeSnippetWidget(
              codeSnippetImageAsset:
                  'assets/snippets/custom_implicit_example_code.png',
            ),
            const ExplicitExample(),
            const ShowCodeSnippetWidget(
              codeSnippetImageAsset:
                  'assets/snippets/explicit_example_code.png',
            ),
            const BatSignalExplicitAnimation(),
            const CustomExplicitSlide(),
            const ShowCodeSnippetWidget(
              codeSnippetImageAsset: 'assets/snippets/clipper_painter.png',
            ),
            HeroAnimation(),
            const ShowCodeSnippetWidget(
              codeSnippetImageAsset: 'assets/snippets/hero_code_example.png',
            ),
            const NavigationExampleScreen(),
            const ThankYouSlide(),
          ],
        ),
      ),
    );
  }
}
