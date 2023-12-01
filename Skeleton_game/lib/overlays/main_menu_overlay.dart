import 'dart:ui';

import 'package:first_flutter_project/overlays/game_hud.dart';
import 'package:first_flutter_project/overlays/setting_overlay.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flutter/material.dart';

class MainMenuOverLay extends StatelessWidget {
  static const id = 'MainMenu';

  final SkeletonGame gameReference;

  const MainMenuOverLay({super.key, required this.gameReference});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
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
                  const Text(
                    'Survive Skeleton Walk',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      gameReference.startGame();
                      gameReference.overlays.remove(MainMenuOverLay.id);
                      gameReference.overlays.add(GameHud.id);
                    },
                    child: const Text(
                      'Play',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      gameReference.overlays.remove(MainMenuOverLay.id);
                      gameReference.overlays.add(SettingOverlay.id);
                    },
                    child: const Text(
                      'Settings',
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
