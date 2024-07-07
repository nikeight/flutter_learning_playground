import 'package:animations/explicit/built_in/explicit_align_transition.dart';
import 'package:animations/explicit/explicit_modal.dart';
import 'package:flutter/material.dart';

class ExplicitBuiltInHomeScreen extends StatelessWidget {
  final ExplicitBuiltIn animationType;

  const ExplicitBuiltInHomeScreen({super.key, required this.animationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a animation type'),
      ),
      body: getSelectedWidget(animationType),
    );
  }

  Widget getSelectedWidget(ExplicitBuiltIn type) {
    switch (animationType) {
      case ExplicitBuiltIn.alignTransition:
        return const ExplicitAlignTransition();
      case ExplicitBuiltIn.animatedModalBarrier:
        return Text(animationType.name);
      case ExplicitBuiltIn.decoratedBoxTransition:
        return Text(animationType.name);
      case ExplicitBuiltIn.defaultTextStyleTransition:
        return Text(animationType.name);
      case ExplicitBuiltIn.positionedTransition:
        return Text(animationType.name);
      case ExplicitBuiltIn.relativePositionedTransition:
        return Text(animationType.name);
      case ExplicitBuiltIn.rotationTransition:
        return Text(animationType.name);
      case ExplicitBuiltIn.scaleTransition:
        return Text(animationType.name);
      case ExplicitBuiltIn.sizeTransition:
        return Text(animationType.name);
      case ExplicitBuiltIn.slideTransition:
        return Text(animationType.name);
      case ExplicitBuiltIn.fadeTransition:
        return Text(animationType.name);
    }
  }
}
