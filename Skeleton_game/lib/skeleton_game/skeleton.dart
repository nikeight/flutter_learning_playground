import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class Skeleton extends SpriteAnimationComponent {
  final Image skeletonWalkImage;
  final Image skeletonHitImage;
  final Image skeletonAttackImage;
  final Image skeletonDeadImage;

  Skeleton({
    required this.skeletonWalkImage,
    required this.skeletonHitImage,
    required this.skeletonAttackImage,
    required this.skeletonDeadImage,
  });

  @override
  void onMount() {
    animation = walkAnimation();
    scale = Vector2(2, 2);
    y = size.y + 65;
    x = 200;
    super.onMount();
  }

  walkAnimation() => SpriteAnimation.fromFrameData(
        skeletonWalkImage,
        SpriteAnimationData.sequenced(
          amount: 12,
          stepTime: 0.1,
          textureSize: Vector2(22, 33),
          texturePosition: Vector2(22, 0),
        ),
      );

  hitAnimation() => SpriteAnimation.fromFrameData(
        skeletonHitImage,
        SpriteAnimationData.sequenced(
          amount: 7,
          stepTime: 0.2,
          textureSize: Vector2(30, 32),
          texturePosition: Vector2(30, 0),
        ),
      );

  attackAnimation() => SpriteAnimation.fromFrameData(
        skeletonAttackImage,
        SpriteAnimationData.sequenced(
          amount: 17,
          stepTime: 0.1,
          textureSize: Vector2(43, 37),
          texturePosition: Vector2(43, 2),
        ),
      );

  deadAnimation() => SpriteAnimation.fromFrameData(
        skeletonDeadImage,
        SpriteAnimationData.sequenced(
          amount: 14,
          stepTime: 0.1,
          textureSize: Vector2(33, 33),
          texturePosition: Vector2(33, 0),
        ),
      );
}
