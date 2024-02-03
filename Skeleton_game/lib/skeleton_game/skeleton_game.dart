import 'package:skeleton_walk/enemy/enemy_manager.dart';
import 'package:skeleton_walk/models/player_data.dart';
import 'package:skeleton_walk/models/settings_data.dart';
import 'package:skeleton_walk/overlays/game_hud.dart';
import 'package:skeleton_walk/overlays/game_over_overlay.dart';
import 'package:skeleton_walk/overlays/pause_overlay.dart';
import 'package:skeleton_walk/skeleton_game/flame_game_audio_manager.dart';
import 'package:skeleton_walk/skeleton_game/skeleton.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SkeletonGame extends FlameGame with TapDetector, HasCollisionDetection, DragCallbacks {
  static const _imageAssets = [
    'skeleton_stripes/walk.png',
    'skeleton_stripes/attack.png',
    'skeleton_stripes/hit.png',
    'skeleton_stripes/dead.png',
    'skeleton_stripes/idle.png',
    'enemy_stripes/ghoul_run.png',
    'enemy_stripes/bat_fly.png',
    'enemy_stripes/acid_eye.png',
    'enemy_stripes/snake.png',
  ];

  // List of all the audio assets.
  static const _audioAssets = [
    'button_click.wav',
    'bg_music.wav',
    'axe_swing.wav',
    'jump.wav',
    'hit.wav',
    'dead.wav',
  ];

  // Ground Space
  static const double groundSpace = 14;

  late Skeleton _skeleton;
  late PlayerData playerData;
  late SettingsData settingsData;
  late EnemyManager _enemyManager;

  @override
  Future<void> onLoad() async {
    // Setup Camera
    camera.viewport = FixedResolutionViewport(Vector2(size.x, size.y));

    // Cache Load images
    await images.loadAll(_imageAssets);

    // Setup the Hive Boxes
    playerData = await _readPlayerData();
    settingsData = await _readSettingsData();

    // Setup Audio Manager
    FGAudioManager.instance.initAudioManager(_audioAssets, settingsData);

    /// Create a [ParallaxComponent]
    final parallaxBackground = await loadParallaxComponent(
      [
        ParallaxImageData('background/background_1.png'),
        ParallaxImageData('background/background_2.png'),
        ParallaxImageData('background/background_3.png'),
        ParallaxImageData('background/background_4.png'),
        ParallaxImageData('background/background_5.png'),
        ParallaxImageData('background/ground.png'),
      ],
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.4, 0),
    );

    add(parallaxBackground);

    // Start BG music
    FGAudioManager.instance.startBgm('bg_music.wav');
  }

  @override
  void onTapDown(TapDownInfo info) {
    _skeleton.updateCollisionTypeForAttackCurrent();
    FGAudioManager.instance.playSfx(SfxAudioEvent.attack);
    _skeleton.current = SkeletonState.attack;
    super.onTapDown(info);
  }

  /// We do a jump whenever the
  /// Y velocity is in negative i.e
  /// a drag event detected for upward drag
  @override
  void onDragEnd(DragEndEvent event) {
    if (event.velocity.y <= 0) {
      FGAudioManager.instance.playSfx(SfxAudioEvent.jump);
      _skeleton.skeletonJump();
    }
    super.onDragEnd(event);
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

  void startGame() {
    _skeleton = Skeleton(
      playerData: playerData,
      animations: {
        SkeletonState.idle: SpriteAnimation.fromFrameData(
          images.fromCache('skeleton_stripes/idle.png'),
          SpriteAnimationData.sequenced(
            amount: 11,
            stepTime: 0.1,
            textureSize: Vector2(24, 32),
            // texturePosition: Vector2(22, 0),
          ),
        ),
        SkeletonState.walk: SpriteAnimation.fromFrameData(
          images.fromCache('skeleton_stripes/walk.png'),
          SpriteAnimationData.sequenced(
            amount: 12,
            stepTime: 0.1,
            textureSize: Vector2(22, 33),
            // texturePosition: Vector2(22, 0),
          ),
        ),
        SkeletonState.hit: SpriteAnimation.fromFrameData(
          images.fromCache('skeleton_stripes/hit.png'),
          SpriteAnimationData.sequenced(
              amount: 8,
              stepTime: 0.1,
              textureSize: Vector2(30, 32),
              texturePosition: Vector2(-60, 0),
              loop: false),
        ),
        SkeletonState.attack: SpriteAnimation.fromFrameData(
          images.fromCache('skeleton_stripes/attack.png'),
          SpriteAnimationData.sequenced(
              amount: 14,
              stepTime: 0.08,
              textureSize: Vector2(43, 37),
              texturePosition: Vector2(43, 2),
              loop: false),
        ),
        SkeletonState.dead: SpriteAnimation.fromFrameData(
          images.fromCache('skeleton_stripes/dead.png'),
          SpriteAnimationData.sequenced(
              amount: 15,
              stepTime: 0.1,
              textureSize: Vector2(33, 33),
              texturePosition: Vector2(33, 0),
              loop: false),
        )
      },
      current: SkeletonState.walk,
    );
    _enemyManager = EnemyManager();

    add(_skeleton);
    add(_enemyManager);

    _enemyManager.enemySpawnTimer.onTick = () {
      _enemyManager.spawnRandomEnemies();
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
          SettingsData(bgm: true, sfx: true, halloweenMode: false));
    }

    return settingsDataBox.get(SettingsData.settingsDataHiveKey)!;
  }
}
