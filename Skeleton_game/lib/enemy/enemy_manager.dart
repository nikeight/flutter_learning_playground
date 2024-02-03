import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:skeleton_walk/enemy/enemy.dart';
import 'package:skeleton_walk/models/enemy_data.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';

class EnemyManager extends Component with HasGameReference<SkeletonGame> {
  final List<EnemyData> _enemiesTypeList = [];

  final Random randomSpawn = Random();

  final Timer enemySpawnTimer = Timer(3, repeat: true);

  spawnRandomEnemies() {
    // Selects a random enemy type
    final randomIndex = randomSpawn.nextInt(_enemiesTypeList.length);
    final randomEnemyData = _enemiesTypeList[randomIndex];
    final enemy = Enemy(randomEnemyData);

    // Anchor it from Left side of the Screen
    enemy.anchor = Anchor.bottomLeft;
    enemy.position = Vector2(
      game.size.x + 32,
      game.size.y - enemy.y,
    );

    //[Special Case: If enemy can fly]
    // Add extra height
    if(randomEnemyData.canFly){
      final extraHeight = randomSpawn.nextDouble() * 2 * randomEnemyData.textureSize.y;
      enemy.position.y -= extraHeight;
    }

    if(randomEnemyData.scaleEntity){
      enemy.scale = Vector2(1.5, 1.5);
    }

    enemy.size = randomEnemyData.textureSize;
    game.add(enemy);
  }

  @override
  void onMount() {
    if (isMounted) {
      removeFromParent();
    }

    // Populate the enemy data list once
    if(_enemiesTypeList.isEmpty){
      _enemiesTypeList.addAll([
        EnemyData(
          image: game.images.fromCache('enemy_stripes/ghoul_run.png'),
          nFrames: 7,
          textureSize: Vector2(31.7, 26),
          texturePosition: Vector2(31, 0),
          speedX: 80,
          canFly: false,
          scaleEntity: false,
        ),
        EnemyData(
          image: game.images.fromCache('enemy_stripes/bat_fly.png'),
          nFrames: 3,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 0),
          speedX: 64,
          canFly: true,
          scaleEntity: true,
        ),
        EnemyData(
          image: game.images.fromCache('enemy_stripes/snake.png'),
          nFrames: 7,
          textureSize: Vector2(31.5, 20),
          texturePosition: Vector2(32, 0),
          speedX: 48,
          canFly: false,
          scaleEntity: true,
        ),
        EnemyData(
          image: game.images.fromCache('enemy_stripes/acid_eye.png'),
          nFrames: 7,
          textureSize: Vector2(31.5, 21),
          texturePosition: Vector2(32, 0),
          speedX: 56,
          canFly: false,
          scaleEntity: true,
        ),
      ]);
    }
    // Start the timer
    enemySpawnTimer.start();

    super.onMount();
  }

  @override
  void update(double dt) {
    enemySpawnTimer.update(dt);
    super.update(dt);
  }

  void removeAllEnemiesFromWindow() {
    final listOfEnemies = game.children.whereType<Enemy>();
    for (var enemy in listOfEnemies) {
      enemy.removeFromParent();
    }
  }
}
