import 'dart:async';
import 'dart:ui';

import 'package:first_flutter_project/models/enemy_data.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/palette.dart';

class Enemy extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameReference<SkeletonGame> {
  final EnemyData enemyData;
  final rectHitBoxBorder = BasicPalette.darkRed.paint()
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
            parentSize: size
        )
            ..paint = rectHitBoxBorder
            ..renderShape = true
    );
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
}
