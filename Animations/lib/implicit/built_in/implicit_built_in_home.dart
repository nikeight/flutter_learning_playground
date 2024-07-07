import 'package:animations/explicit/circular_eight_hand_loading.dart';
import 'package:animations/explicit/circular_shrink_grow_loader.dart';
import 'package:animations/implicit/built_in/implicit_aniamte_padding.dart';
import 'package:animations/implicit/built_in/implicit_animate_align.dart';
import 'package:animations/implicit/built_in/implicit_animate_container.dart';
import 'package:animations/implicit/built_in/implicit_animate_cross_fade.dart';
import 'package:animations/implicit/built_in/implicit_animate_opacity.dart';
import 'package:animations/implicit/built_in/implicit_animate_physical_modal.dart';
import 'package:animations/implicit/built_in/implicit_animate_positioned.dart';
import 'package:animations/implicit/built_in/implicit_animate_positioned_directional.dart';
import 'package:animations/implicit/built_in/implicit_animate_rotation.dart';
import 'package:animations/implicit/built_in/implicit_animate_scale.dart';
import 'package:animations/implicit/built_in/implicit_animate_size.dart';
import 'package:animations/implicit/built_in/implicit_animate_slide.dart';
import 'package:animations/implicit/built_in/implicit_animate_text.dart';
import 'package:animations/implicit/built_in/implicit_animate_theme.dart';
import 'package:animations/implicit/built_in/implicit_modal.dart';
import 'package:animations/implicit/built_in/semi_cicrle_scanner_radiator.dart';
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
        return const ImplicitAnimateContainer();
      case ImplicitBuiltIn.animatedDefaultTextStyle:
        return const ImplicitAnimateText();
      case ImplicitBuiltIn.animatedScale:
        return const ImplicitAnimateScale();
      case ImplicitBuiltIn.animatedRotation:
        return const ImplicitAnimateRotation();
      case ImplicitBuiltIn.animatedSlide:
        return const ImplicitAnimateSlide();
      case ImplicitBuiltIn.animatedOpacity:
        return const ImplicitAnimateOpacity();
      case ImplicitBuiltIn.animatedPadding:
        return const ImplicitAnimatePadding();
      case ImplicitBuiltIn.animatedPhysicalModel:
        return const ImplicitAnimatePhysicalModal();
      case ImplicitBuiltIn.animatedPositioned:
        return const ImplicitAnimatePositioned();
      case ImplicitBuiltIn.animatedPositionedDirectional:
        return const ImplicitAnimatePositionedDirectional();
      case ImplicitBuiltIn.animatedTheme:
        return const ImplicitAnimateTheme();
      case ImplicitBuiltIn.animatedCrossFade:
        return const ImplicitAnimateCrossFade();
      case ImplicitBuiltIn.animatedSize:
        return const ImplicitAnimateSize();
      case ImplicitBuiltIn.animatedSwitcher:
        return const Text('Animate Switcher');
    }
  }
}
