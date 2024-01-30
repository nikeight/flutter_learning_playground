import 'package:flame/extensions.dart';

class EnemyData {
  final Image image;
  final int nFrames;
  final Vector2 textureSize;
  final Vector2 texturePosition;
  final double speedX;
  final bool canFly;

  const EnemyData({
    required this.image,
    required this.nFrames,
    required this.textureSize,
    required this.texturePosition,
    required this.speedX,
    required this.canFly,
  });
}
