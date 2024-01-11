import 'package:animations/implicit/implicit_modal.dart';
import 'package:flutter/material.dart';

class ImplicitBuiltInHomeScreen extends StatelessWidget {
  final ImplicitBuiltIn animationType;

  const ImplicitBuiltInHomeScreen({super.key, required this.animationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a animation type'),
      ),
      body: getSelectedWidget(animationType),
    );
  }

  Widget getSelectedWidget(ImplicitBuiltIn type) {
    switch (animationType) {
      case ImplicitBuiltIn.animatedRotation:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedOpacity:
        return Text(animationType.name);
      case ImplicitBuiltIn.animatedTransition:
        return Text(animationType.name);
    }
  }
}
