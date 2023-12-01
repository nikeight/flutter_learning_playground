import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/extensions.dart';

class Skeleton extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameReference<SkeletonGame> {
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
    // `70` as we have scaled the Skeleton to twice,(not 35)
    position = Vector2(180, game.size.y - 70);
    x = 180;
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

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }
}
