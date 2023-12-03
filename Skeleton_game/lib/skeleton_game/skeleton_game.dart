import 'package:first_flutter_project/enemy/enemy_manager.dart';
import 'package:first_flutter_project/overlays/game_hud.dart';
import 'package:first_flutter_project/skeleton_game/skeleton.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';

class SkeletonGame extends FlameGame with TapDetector, HasCollisionDetection {
  static const _imageAssets = [
    'skeleton_stripes/walk.png',
    'skeleton_stripes/attack.png',
    'skeleton_stripes/hit.png',
    'skeleton_stripes/dead.png',
    'enemy_stripes/ghoul_run.png'
  ];

  late Skeleton _skeleton;
  final EnemyManager _enemyManager = EnemyManager();
  final Timer _attackAnimationTimer = Timer(1.5);

  @override
  Future<void> onLoad() async {
    _attackAnimationTimer.pause();
    await images.loadAll(_imageAssets);
    camera.viewport = FixedResolutionViewport(Vector2(size.x, size.y));

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

    add(parallaxBackground);
  }

  @override
  void mount() {
    _attackAnimationTimer.onTick = () {
      _skeleton.animation = _skeleton.walkAnimation();
    };
    super.mount();
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
    _skeleton.animation = _skeleton.attackAnimation();
    _attackAnimationTimer.start();
  }

  void startGame() {
    _skeleton = Skeleton(
      skeletonWalkImage: images.fromCache('skeleton_stripes/walk.png'),
      skeletonHitImage: images.fromCache('skeleton_stripes/hit.png'),
      skeletonAttackImage: images.fromCache('skeleton_stripes/attack.png'),
      skeletonDeadImage: images.fromCache('skeleton_stripes/dead.png'),
    );

    // _enemyManager = EnemyManager(images.fromCache('enemy_stripes/ghoul_run.png'));

    add(_skeleton);
    add(_enemyManager);
    _enemyManager.enemySpawnTimer.onTick = (){
      _enemyManager.spawnEnemies();
    };
  }

  void reset() {
    _skeleton.removeFromParent();
    _enemyManager.removeAllEnemiesFromWindow();
    _enemyManager.removeFromParent();
    overlays.remove(GameHud.id);
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
      case AppLifecycleState.hidden:
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
