import 'package:first_flutter_project/models/player_data.dart';
import 'package:first_flutter_project/overlays/pause_overlay.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Displays the Players data at the top of the Screen
/// Which Includes
/// Pause
/// Highest Score
/// Current Score
/// Lives left
class GameHud extends StatelessWidget {
  final SkeletonGame gameReference;

  const GameHud(this.gameReference, {super.key});

  static const id = 'GameHud';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: gameReference.playerData,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.lives,
              builder: (_, lives, __) {
                return Row(
                  children: List.generate(5, (index) {
                    if (index < lives) {
                      return const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      );
                    } else {
                      return const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      );
                    }
                  }),
                );
              },
            ),
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.currentScore,
              builder: (_, currentScore, __) {
                return Text("Current Score : $currentScore");
              },
            ),
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.highScore,
              builder: (_, highScore, __) {
                return Text("Highest Score : $highScore");
              },
            ),
            TextButton(
              onPressed: () {
                gameReference.overlays.remove(GameHud.id);
                gameReference.overlays.add(PauseOverlay.id);
                gameReference.pauseEngine();
                // AudioManager.instance.pauseBgm();
              },
              child: const Icon(Icons.pause, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
