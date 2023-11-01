import 'package:first_flutter_project/skeleton_game/skeleton.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

class SkeletonGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Skeleton skeleton;
  final Timer _attackAnimationTimer = Timer(1.5);

  static const _imageAssets = [
    'skeleton_stripes/walk.png',
    'skeleton_stripes/attack.png',
    'skeleton_stripes/hit.png',
    'skeleton_stripes/dead.png',
  ];

  @override
  Future<void> onLoad() async {
    await images.loadAll(_imageAssets);

    /// Create a [ParallaxComponent]
    final parallaxBackground = await loadParallaxComponent(
      [
        ParallaxImageData('background/background_1.png'),
        ParallaxImageData('background/background_2.png'),
        ParallaxImageData('background/background_3.png'),
        ParallaxImageData('background/background_4.png'),
        ParallaxImageData('background/background_5.png'),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.4, 0),
    );

    skeleton = Skeleton(
      skeletonWalkImage: images.fromCache('skeleton_stripes/walk.png'),
      skeletonHitImage: images.fromCache('skeleton_stripes/hit.png'),
      skeletonAttackImage: images.fromCache('skeleton_stripes/attack.png'),
      skeletonDeadImage: images.fromCache('skeleton_stripes/dead.png'),
    );

    add(parallaxBackground);
    add(skeleton);

    return super.onLoad();
  }

  @override
  void mount() {
    super.mount();
    _attackAnimationTimer.onTick = () {
      skeleton.animation = skeleton.walkAnimation();
    };
  }

  @override
  void update(double dt) {
    super.update(dt);
    _attackAnimationTimer.update(dt);
  }

  @override
  void onTapDown(TapDownInfo info) {
    _attackSkeletonAction();
    super.onTapDown(info);
  }

  void _attackSkeletonAction() {
    skeleton.animation = skeleton.attackAnimation();
    _attackAnimationTimer.start();
  }

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      // On resume, if active overlay is not PauseMenu,
      // resume the engine (lets the parallax effect play).
      //   if (!(overlays.isActive(PauseMenu.id)) &&
      //       !(overlays.isActive(GameOverMenu.id))) {
      //     resumeEngine();
      //   }
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      // If game is active, then remove Hud and add PauseMenu
      // before pausing the game.
      //   if (overlays.isActive(Hud.id)) {
      //     overlays.remove(Hud.id);
      //     overlays.add(PauseMenu.id);
      //   }
        pauseEngine();
        break;
    }
    super.lifecycleStateChange(state);
  }
}
