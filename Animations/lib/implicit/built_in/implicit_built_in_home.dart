import 'package:animations/implicit/built_in/implicit_animate_align.dart';
import 'package:animations/implicit/built_in/implicit_modal.dart';
import 'package:flutter/material.dart';

class ImplicitBuiltInHomeScreen extends StatelessWidget {
  final ImplicitBuiltIn animationType;

  const ImplicitBuiltInHomeScreen({super.key, required this.animationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animationType.name),
      ),
      body: getSelectedWidget(animationType),
    );
  }

  Widget getSelectedWidget(ImplicitBuiltIn type) {
    switch (animationType) {
      case ImplicitBuiltIn.animatedAlign:
        return const ImplicitAnimateAlign();
      case ImplicitBuiltIn.animatedContainer:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedDefaultTextStyle:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedScale:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedRotation:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedSlide:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedOpacity:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedPadding:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedPhysicalModel:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedPositioned:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedPositionedDirectional:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedTheme:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedCrossFade:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedSize:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedSwitcher:
        return Text(animationType.name);
    }
  }
}
