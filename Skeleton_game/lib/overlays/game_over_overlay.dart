import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_walk/models/player_data.dart';
import 'package:skeleton_walk/overlays/game_hud.dart';
import 'package:skeleton_walk/overlays/main_menu_overlay.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';

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
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'BlackShepherd',
                      ),
                    ),
                    Selector<PlayerData, int>(
                      selector: (_, playerData) => playerData.currentScore,
                      builder: (_, currentScore, __) => Text(
                        'Your Score : $currentScore',
                        style:
                        const TextStyle(fontSize: 42, fontFamily: 'BlackShepherd'),
                      ),
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Exit',
                        style: TextStyle(fontSize: 30, fontFamily: 'BlackShepherd'),
                      ),
                      onPressed: () {
                        skeletonGameRef.overlays.remove(GameOverOverlay.id);
                        skeletonGameRef.overlays.add(MainMenuOverLay.id);
                        skeletonGameRef.resumeEngine();
                        skeletonGameRef.reset();
                        // AudioManager.instance.resumeBgm();
                      },
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      child: const Text(
                        'Play Again',
                        style: TextStyle(fontSize: 30, fontFamily: 'BlackShepherd'),
                      ),
                      onPressed: () {
                        skeletonGameRef.overlays.remove(GameOverOverlay.id);
                        skeletonGameRef.overlays.add(GameHud.id);
                        skeletonGameRef.resumeEngine();
                        skeletonGameRef.reset();
                        skeletonGameRef.startGame();
                        // AudioManager.instance.resumeBgm();
                      },
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
