import 'package:first_flutter_project/overlays/pause_overlay.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: List.generate(5, (index) {
              if (index < 5) {
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
          ),
          const Text("Current Score : 3252"),
          const Text("Highest Score : 99999"),
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
    );
  }
}
