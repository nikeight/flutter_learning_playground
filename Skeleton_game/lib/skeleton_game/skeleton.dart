import 'dart:async';
import 'dart:ui';
import 'package:first_flutter_project/enemy/enemy.dart';
import 'package:first_flutter_project/models/player_data.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/palette.dart';

class Skeleton extends SpriteAnimationGroupComponent<SkeletonState>
    with CollisionCallbacks, HasGameReference<SkeletonGame> {
  final PlayerData playerData;

  final rectHitBoxBorder = BasicPalette.darkRed.paint()
    ..style = PaintingStyle.stroke;

  final attackHitBoxBorder = BasicPalette.darkGreen.paint()
    ..style = PaintingStyle.stroke;

  late final PolygonHitbox _walkHitBox;
  late final PolygonHitbox _attackHitBox;

  Skeleton(
      {required this.playerData,
      super.animations,
      super.current,
      super.autoResize,
      super.playing,
      super.removeOnFinish,
      super.paint,
      super.position,
      super.size,
      super.scale,
      super.angle,
      super.nativeAngle,
      super.anchor,
      super.children,
      super.priority,
      super.key});

  @override
  FutureOr<void> onLoad() async {
    scale = Vector2(2, 2);

    // `70` as we have scaled the Skeleton to twice,(not 35)
    position = Vector2(180, game.size.y - 70);

    _walkHitBox = PolygonHitbox.relative(
      [
        Vector2(0, 1), // Middle of top wall
        Vector2(1, 0), // Middle of right wall
        Vector2(0, -1), // Middle of bottom wall
        Vector2(-1, 0), // Middle of left wall
      ],
      parentSize: size,
      collisionType: CollisionType.active,
    )
      ..renderShape = false
      ..paint = rectHitBoxBorder;

    _attackHitBox = PolygonHitbox.relative(
      [
        Vector2(0, 1), // Middle of top wall
        Vector2(1, 0), // Middle of right wall
        Vector2(0, -1), // Middle of bottom wall
        Vector2(-1, 0), // Middle of left wall
      ],
      parentSize: Vector2(40, 30),
      collisionType: CollisionType.inactive,
    )
      ..renderShape = false
      ..paint = attackHitBoxBorder;

    await addAll([_walkHitBox, _attackHitBox]);

    animationTickers?[SkeletonState.attack]?.onComplete = () {
      animationTicker?.reset();
      game.isSkeletonAttacking = false;
      current = SkeletonState.walk;
      playerData.currentState = SkeletonState.walk;
      _attackHitBox.collisionType = CollisionType.inactive;
    };

    animationTickers?[SkeletonState.hit]?.onComplete = () {
      animationTicker?.reset();
      current = SkeletonState.walk;
    };

    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if ((other is Enemy) &&
        current != SkeletonState.hit &&
        playerData.currentState == SkeletonState.walk) {
      _hitDetected();
    }
  }

  void _hitDetected() {
    current = SkeletonState.hit;
    playerData.lives -= 1;
    if (playerData.currentScore > 0) {
      playerData.currentScore -= 1;
    }
  }

  void updateCollisionTypeForAttackCurrent() {
    playerData.currentState = SkeletonState.attack;
    _attackHitBox.collisionType = CollisionType.active;
  }
}

enum SkeletonState {
  idle,
  react,
  walk,
  attack,
  hit,
  dead,
}
