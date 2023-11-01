import 'package:flame/components.dart';

enum SkeletonState{
  idle,
  react,
  walk,
  attack,
  hit,
  dead,
}

final _animationMap = {
  SkeletonState.idle: SpriteAnimationData.sequenced(
    amount: 4,
    stepTime: 0.1,
    textureSize: Vector2.all(24),
  ),
  SkeletonState.react: SpriteAnimationData.sequenced(
    amount: 6,
    stepTime: 0.1,
    textureSize: Vector2.all(24),
    texturePosition: Vector2((4) * 24, 0),
  ),
  SkeletonState.walk: SpriteAnimationData.sequenced(
    amount: 4,
    stepTime: 0.1,
    textureSize: Vector2.all(24),
    texturePosition: Vector2((4 + 6) * 24, 0),
  ),
  SkeletonState.attack: SpriteAnimationData.sequenced(
    amount: 3,
    stepTime: 0.1,
    textureSize: Vector2.all(24),
    texturePosition: Vector2((4 + 6 + 4) * 24, 0),
  ),
  SkeletonState.hit: SpriteAnimationData.sequenced(
    amount: 7,
    stepTime: 0.1,
    textureSize: Vector2.all(24),
    texturePosition: Vector2((4 + 6 + 4 + 3) * 24, 0),
  ),
  SkeletonState.dead: SpriteAnimationData.sequenced(
    amount: 7,
    stepTime: 0.1,
    textureSize: Vector2.all(24),
    texturePosition: Vector2((4 + 6 + 4 + 3) * 24, 0),
  ),
};