import 'package:flutter/material.dart';

/// Displays the Players data at the top of the Screen
/// Which Includes
/// Pause
/// Highest Score
/// Current Score
/// Lives left
class GameHud extends StatelessWidget {
  const GameHud({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                // gameRef.overlays.remove(Hud.id);
                // gameRef.overlays.add(PauseMenu.id);
                // gameRef.pauseEngine();
                // AudioManager.instance.pauseBgm();
              },
              child: const Icon(Icons.pause, color: Colors.white),
            )
          ],
        ));
  }
}
