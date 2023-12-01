import 'package:first_flutter_project/enemy/enemy.dart';
import 'package:first_flutter_project/models/enemy_data.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class EnemyManager extends Component with HasGameReference<SkeletonGame> {
  final List<EnemyData> _enemiesTypeList = [];

  final Timer enemySpawnTimer = Timer(2, repeat: true);


  spawnEnemies() {
    _enemiesTypeList.add(
      EnemyData(
        image: game.images.fromCache('enemy_stripes/ghoul_run.png'),
        nFrames: 7,
        textureSize: Vector2(31.7, 26),
        texturePosition: Vector2(31, 0),
        speedX: 80,
      ),
    );
    final ghoulEnemyData = _enemiesTypeList.first;
    final enemy = Enemy(ghoulEnemyData);
    enemy.anchor = Anchor.bottomLeft;
    enemy.position = Vector2(
      game.size.x + 32,
      game.size.y - enemy.y,
    );
    enemy.size = ghoulEnemyData.textureSize;
    game.add(enemy);
  }

  @override
  void onMount() {
    if (isMounted) {
      removeFromParent();
    }


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
