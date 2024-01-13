class ExplicitModal {
  final String desc;
  final Uri docsLink;
  final ExplicitBuiltIn animationType;

  ExplicitModal(
    this.desc,
    this.docsLink,
    this.animationType,
  );
}

enum ExplicitBuiltIn {
  alignTransition,
  animatedModalBarrier,
  decoratedBoxTransition,
  defaultTextStyleTransition,
  positionedTransition,
  relativePositionedTransition,
  rotationTransition,
  scaleTransition,
  sizeTransition,
  slideTransition,
  fadeTransition,
}
