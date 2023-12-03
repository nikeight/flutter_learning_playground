import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:first_flutter_project/enemy/enemy.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';

class Skeleton extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameReference<SkeletonGame> {
  final Image skeletonWalkImage;
  final Image skeletonHitImage;
  final Image skeletonAttackImage;
  final Image skeletonDeadImage;
  bool _isSkeletonHit = false;
  final Timer _hitTimer = Timer(1);
  final rectHitBoxBorder = BasicPalette.darkRed.paint()
    ..style = PaintingStyle.stroke;

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

    _hitTimer.onTick = () {
      animation = walkAnimation();
      _isSkeletonHit = false;
    };

    // Add a hitBox
    add(
      RectangleHitbox.relative(
        Vector2(0.3,1),
        parentSize: size,
        position: Vector2(size.x * 0.3 ,size.y * 0.9) / 2
      )
        ..renderShape = true
        ..paint = rectHitBoxBorder,
    );
    super.onMount();
  }

  walkAnimation() => SpriteAnimation.fromFrameData(
        skeletonWalkImage,
        SpriteAnimationData.sequenced(
          amount: 12,
          stepTime: 0.1,
          textureSize: Vector2(22, 33),
          // texturePosition: Vector2(22, 0),
        ),
      );

  hitAnimation() => SpriteAnimation.fromFrameData(
        skeletonHitImage,
        SpriteAnimationData.sequenced(
          amount: 7,
          stepTime: 0.1,
          textureSize: Vector2(30, 32),
          texturePosition: Vector2(-30, 0),
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
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if ((other is Enemy && !_isSkeletonHit)) {
      _hitDetected();
    }
  }

  @override
  void update(double dt) {
    _hitTimer.update(dt);
    super.update(dt);
  }

  void _hitDetected() {
    _isSkeletonHit = true;
    animation = hitAnimation();
    _hitTimer.start();
    log("Hit being Called");
  }
}
