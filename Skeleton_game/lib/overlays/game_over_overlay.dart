import 'dart:ui';

import 'package:flutter/material.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  const Text(
                    'Game Over',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const Text(
                    'Your Score : 23525',
                    style: TextStyle(fontSize: 24, color: Colors.white),
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
                          // gameRef.overlays.remove(GameOverMenu.id);
                          // gameRef.overlays.add(MainMenu.id);
                          // gameRef.resumeEngine();
                          // gameRef.reset();
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
                          // gameRef.overlays.remove(GameOverMenu.id);
                          // gameRef.overlays.add(Hud.id);
                          // gameRef.resumeEngine();
                          // gameRef.reset();
                          // gameRef.startGamePlay();
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
    );
  }
}
