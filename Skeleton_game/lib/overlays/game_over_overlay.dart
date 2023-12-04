import 'dart:ui';

import 'package:first_flutter_project/models/player_data.dart';
import 'package:first_flutter_project/overlays/game_hud.dart';
import 'package:first_flutter_project/overlays/main_menu_overlay.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameOverOverlay extends StatelessWidget {
  static const id = 'GameOverMenu';
  final SkeletonGame skeletonGameRef;

  const GameOverOverlay(this.skeletonGameRef, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: skeletonGameRef.playerData,
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Card(
            shadowColor: Colors.black.withAlpha(55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.black.withAlpha(80),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    const Text(
                      'Game Over',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                    Selector<PlayerData, int>(
                      selector: (_, playerData) => playerData.currentScore,
                      builder: (_, currentScore, __) => Text(
                        'Your Score : $currentScore',
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            'Exit',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          onPressed: () {
                            skeletonGameRef.overlays.remove(GameOverOverlay.id);
                            skeletonGameRef.overlays.add(MainMenuOverLay.id);
                            skeletonGameRef.resumeEngine();
                            skeletonGameRef.reset();
                            // AudioManager.instance.resumeBgm();
                          },
                        ),
                        ElevatedButton(
                          child: const Text(
                            'Play Again',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          onPressed: () {
                            skeletonGameRef.overlays.remove(GameOverOverlay.id);
                            skeletonGameRef.overlays.add(GameHud.id);
                            skeletonGameRef.resumeEngine();
                            skeletonGameRef.reset();
                            skeletonGameRef.startGame();
                            // AudioManager.instance.resumeBgm();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
