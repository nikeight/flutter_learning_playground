import 'package:first_flutter_project/enemy/enemy_manager.dart';
import 'package:first_flutter_project/models/player_data.dart';
import 'package:first_flutter_project/models/settings_data.dart';
import 'package:first_flutter_project/overlays/game_hud.dart';
import 'package:first_flutter_project/overlays/game_over_overlay.dart';
import 'package:first_flutter_project/overlays/pause_overlay.dart';
import 'package:first_flutter_project/skeleton_game/flame_game_audio_manager.dart';
import 'package:first_flutter_project/skeleton_game/skeleton.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SkeletonGame extends FlameGame with TapDetector, HasCollisionDetection {
  static const _imageAssets = [
    'skeleton_stripes/walk.png',
    'skeleton_stripes/attack.png',
    'skeleton_stripes/hit.png',
    'skeleton_stripes/dead.png',
    'enemy_stripes/ghoul_run.png'
  ];

  // List of all the audio assets.
  static const _audioAssets = [''];

  late Skeleton _skeleton;
  late PlayerData playerData;
  late SettingsData settingsData;
  final EnemyManager _enemyManager = EnemyManager();
  final Timer _attackAnimationTimer = Timer(1.5);

  bool isSkeletonAttacking = false;

  @override
  Future<void> onLoad() async {
    // Setup Camera
    camera.viewport = FixedResolutionViewport(Vector2(size.x, size.y));

    // Cache Load images
    await images.loadAll(_imageAssets);

    // Avoid the timer to start
    _attackAnimationTimer.pause();

    // Setup the Hive Boxes
    playerData = await _readPlayerData();
    settingsData = await _readSettingsData();

    // Setup Audio Manager
    // FGAudioManager.instance.initAudioManager(_audioAssets, settingsData);

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
      isSkeletonAttacking = false;
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

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // On resume, if active overlay is not PauseMenu,
        // resume the engine (lets the parallax effect play).
        if (!(overlays.isActive(PauseOverlay.id)) &&
            !(overlays.isActive(GameOverOverlay.id))) {
          resumeEngine();
        }
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
        // If game is active, then remove Hud and add PauseMenu
        // before pausing the game.
        if (overlays.isActive(GameHud.id)) {
          overlays.remove(GameHud.id);
          overlays.add(PauseOverlay.id);
        }
        pauseEngine();
        break;
    }
    super.lifecycleStateChange(state);
  }

  void _attackSkeletonAction() {
    isSkeletonAttacking = true;
    _skeleton.animation = _skeleton.attackAnimation();
    _attackAnimationTimer.start();
  }

  void startGame() {
    _skeleton = Skeleton(
        skeletonWalkImage: images.fromCache('skeleton_stripes/walk.png'),
        skeletonHitImage: images.fromCache('skeleton_stripes/hit.png'),
        skeletonAttackImage: images.fromCache('skeleton_stripes/attack.png'),
        skeletonDeadImage: images.fromCache('skeleton_stripes/dead.png'),
        playerData: playerData);

    // _enemyManager = EnemyManager(images.fromCache('enemy_stripes/ghoul_run.png'));

    add(_skeleton);
    add(_enemyManager);
    _enemyManager.enemySpawnTimer.onTick = () {
      _enemyManager.spawnEnemies();
    };
  }

  void reset() {
    _skeleton.removeFromParent();
    _enemyManager.removeAllEnemiesFromWindow();
    _enemyManager.removeFromParent();
    overlays.remove(GameHud.id);
  }

  Future<PlayerData> _readPlayerData() async {
    final playerDataBox = await Hive.openBox<PlayerData>('player_data_box');
    final playerData = playerDataBox.get(PlayerData.playerDataHiveKey);

    if (playerData == null) {
      await playerDataBox.put(PlayerData.playerDataHiveKey, PlayerData());
    }

    return playerDataBox.get(PlayerData.playerDataHiveKey)!;
  }

  Future<SettingsData> _readSettingsData() async {
    final settingsDataBox =
        await Hive.openBox<SettingsData>('settings_data_box');
    final settingsData = settingsDataBox.get(SettingsData.settingsDataHiveKey);

    if (settingsData == null) {
      await settingsDataBox.put(SettingsData.settingsDataHiveKey,
          SettingsData(bgm: false, sfx: false, halloweenMode: false));
    }

    return settingsDataBox.get(SettingsData.settingsDataHiveKey)!;
  }
}
