class ImplicitModal {
  final String desc;
  final Uri docLink;
  final ImplicitBuiltIn animationType;

  ImplicitModal(this.animationType, this.desc, this.docLink);
}

enum ImplicitBuiltIn {
  animatedAlign,
  animatedContainer,
  animatedDefaultTextStyle,
  animatedScale,
  animatedRotation,
  animatedSlide,
  animatedOpacity,
  animatedPadding,
  animatedPhysicalModel,
  animatedPositioned,
  animatedPositionedDirectional,
  animatedTheme,
  animatedCrossFade,
  animatedSize,
  animatedSwitcher,
}
