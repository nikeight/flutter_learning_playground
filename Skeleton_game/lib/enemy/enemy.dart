import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/palette.dart';
import 'package:skeleton_walk/models/enemy_data.dart';
import 'package:skeleton_walk/skeleton_game/skeleton.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';

class Enemy extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameReference<SkeletonGame> {

  final EnemyData enemyData;
  final rectHitBoxBorder = BasicPalette.darkPink.paint()
    ..style = PaintingStyle.stroke;

  Enemy(this.enemyData) {
    animation = SpriteAnimation.fromFrameData(
      enemyData.image,
      SpriteAnimationData.sequenced(
        amount: enemyData.nFrames,
        stepTime: 0.1,
        textureSize: enemyData.textureSize,
        texturePosition: enemyData.texturePosition,
      ),
    );
  }

  @override
  FutureOr<void> onLoad() {
    // Adding a Rectangle Around the enemy
    add(
        RectangleHitbox.relative(
            Vector2.all(0.9),
            parentSize: size,
        )
      ..paint = rectHitBoxBorder
      ..renderShape = false,
    );

    // Add Ground Space
    position.y -= SkeletonGame.groundSpace;

    return super.onLoad();
  }

  @override
  void onMount() {
    // To Flip the Enemy stripe horizontally,
    // As the original Stripe move from Left to Right
    // We needed it to be Right to Left
    flipHorizontally();
    super.onMount();
  }

  @override
  void update(double dt) {
    position.x -= enemyData.speedX * dt;

    // Delete Enemy from the frame if already dodged
    if (position.x < -enemyData.textureSize.x) {
      removeFromParent();
    }
    super.update(dt);
  }

  // Score updates only when the Skeleton Kills a enemy
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if ((other is Skeleton) &&
        game.playerData.currentState == SkeletonState.attack) {
      game.playerData.currentScore += 1;
      removeFromParent();
    }
  }
}
