import 'dart:ui';

import 'package:first_flutter_project/overlays/game_hud.dart';
import 'package:first_flutter_project/overlays/main_menu_overlay.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flutter/material.dart';

class PauseOverlay extends StatelessWidget {
  static const id = "PauseMenu";
  final SkeletonGame skeletonGameRef;

  const PauseOverlay(this.skeletonGameRef, {super.key});

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
                      skeletonGameRef.overlays.remove(PauseOverlay.id);
                      skeletonGameRef.overlays.add(GameHud.id);
                      skeletonGameRef.resumeEngine();
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
                      skeletonGameRef.overlays.remove(PauseOverlay.id);
                      skeletonGameRef.overlays.add(GameHud.id);
                      skeletonGameRef.resumeEngine();
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
                      skeletonGameRef.overlays.remove(PauseOverlay.id);
                      skeletonGameRef.overlays.add(MainMenuOverLay.id);
                      skeletonGameRef.resumeEngine();
                      skeletonGameRef.reset();
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
