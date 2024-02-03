import 'dart:async';
import 'dart:ui';
import 'package:skeleton_walk/enemy/enemy.dart';
import 'package:skeleton_walk/models/player_data.dart';
import 'package:skeleton_walk/overlays/game_hud.dart';
import 'package:skeleton_walk/overlays/game_over_overlay.dart';
import 'package:skeleton_walk/skeleton_game/flame_game_audio_manager.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/palette.dart';

class Skeleton extends SpriteAnimationGroupComponent<SkeletonState>
    with CollisionCallbacks, HasGameReference<SkeletonGame> {
  final PlayerData playerData;

  double ySpeed = 0.0;

  double yMax = 0.0;

  static const double gravity = 800;

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

    yMax = y;

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

    // Ticker for Attack Mode,
    // Once Complete the Ticket resets, and current mode changes to Walk.
    // Attack polygon Collision becomes inactive again.
    animationTickers?[SkeletonState.attack]?.onComplete = () {
      animationTicker?.reset();
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

  // Hit Detection logic
  // If Skeleton is Walk or Jump
  // collide with enemy it is reacted as a hit
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if ((other is Enemy) &&
        current != SkeletonState.hit &&
        playerData.currentState == SkeletonState.walk &&
        playerData.currentState != SkeletonState.dead) {
      _hitDetected();
    }

    if ((other is Enemy) &&
        current != SkeletonState.hit &&
        playerData.currentState == SkeletonState.jump &&
        playerData.currentState != SkeletonState.dead) {
      _hitDetected();
    }
  }

  void _hitDetected() {
    FGAudioManager.instance.playSfx(SfxAudioEvent.hit);
    playerData.lives -= 1;
    if (playerData.lives <= 0) {
      FGAudioManager.instance.playSfx(SfxAudioEvent.died);
      gameOver();
    } else {
      current = SkeletonState.hit;
    }
  }

  // Jumps the Skeleton
  // Condition : It needed to be in ground initially
  // Attack Mode gets inActive initially
  // Current Mode changes to `Jump` until the character is in air.
  void skeletonJump() {
    if (_isOnGround) {
      ySpeed = -400;
      current = SkeletonState.idle;
      _attackHitBox.collisionType = CollisionType.inactive;
      playerData.currentState = SkeletonState.jump;
    }
  }

  void updateCollisionTypeForAttackCurrent() {
    playerData.currentState = SkeletonState.attack;
    _attackHitBox.collisionType = CollisionType.active;
  }

  @override
  void update(double dt) {
    // Updates the Y Axis value
    // Helps to bring the Skeleton Down again
    ySpeed += gravity * dt;

    y += ySpeed * dt;

    // If the Skeleton is in ground again
    // Start the Walk Animation
    // Checks if Skeleton is
    // Not Hit, Walk, Attack and Dead State
    // If Not, then make it walk
    if (_isOnGround) {
      y = yMax;
      ySpeed = 0.0;
      if (current != SkeletonState.hit &&
          current != SkeletonState.walk &&
          current != SkeletonState.attack &&
          current != SkeletonState.dead) {
        current = SkeletonState.walk;
        playerData.currentState = SkeletonState.walk;
      }
    }

    super.update(dt);
  }

  bool get _isOnGround => (y >= yMax);

  // Game Overs
  // Hit Animation changed with Dead Animation
  // For the Last life

  void gameOver() {
    playerData.currentState = SkeletonState.dead;
    current = SkeletonState.dead;
    Future.delayed(const Duration(seconds: 2, milliseconds: 500)).then((value) {
      game.pauseEngine();
      game.overlays.remove(GameHud.id);
      game.overlays.add(GameOverOverlay.id);
    });
  }
}

enum SkeletonState { idle, react, walk, attack, hit, dead, jump }
