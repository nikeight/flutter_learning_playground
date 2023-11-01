import 'dart:ui';

import 'package:flutter/material.dart';

class PauseOverlay extends StatelessWidget {
  const PauseOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.black.withAlpha(100),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Score: 258025',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // gameRef.overlays.remove(PauseMenu.id);
                      // gameRef.overlays.add(Hud.id);
                      // gameRef.resumeEngine();
                      // AudioManager.instance.resumeBgm();
                    },
                    child: const Text(
                      'Resume',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // gameRef.overlays.remove(PauseMenu.id);
                      // gameRef.overlays.add(Hud.id);
                      // gameRef.resumeEngine();
                      // gameRef.reset();
                      // gameRef.startGamePlay();
                      // AudioManager.instance.resumeBgm();
                    },
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // gameRef.overlays.remove(PauseMenu.id);
                      // gameRef.overlays.add(MainMenu.id);
                      // gameRef.resumeEngine();
                      // gameRef.reset();
                      // AudioManager.instance.resumeBgm();
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
