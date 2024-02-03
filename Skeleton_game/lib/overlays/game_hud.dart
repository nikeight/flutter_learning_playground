import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_walk/extensions.dart';
import 'package:skeleton_walk/models/player_data.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';

/// Displays the Players data at the top of the Screen
/// Which Includes [Followed Left to Right Order]
/// Lives left
/// Current Score
/// Highest Score
/// Pause
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
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Image(
                          image:
                              AssetImage('assets/images/other/skull_life.png'),
                          width: 18,
                          height: 18,
                        ),
                      );
                    } else {
                      return const SizedBox(
                        width: 16,
                        height: 16,
                      );
                    }
                  }),
                );
              },
            ),
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.currentScore,
              builder: (_, currentScore, __) {
                return Text(
                  "Current Score : $currentScore",
                  style: const TextStyle(
                      fontSize: 18, fontFamily: 'BlackShepherd'),
                );
              },
            ),
            Selector<PlayerData, int>(
              selector: (_, playerData) => playerData.highScore,
              builder: (_, highScore, __) {
                return Text(
                  "Highest Score : $highScore",
                  style: const TextStyle(
                      fontSize: 18, fontFamily: 'BlackShepherd'),
                );
              },
            ),
            TextButton(
              onPressed: () {
                gameReference.pauseGamePlay();
              },
              child: const Icon(Icons.pause, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
