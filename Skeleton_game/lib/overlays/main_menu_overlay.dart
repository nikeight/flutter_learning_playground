import 'dart:ui';

import 'package:skeleton_walk/overlays/game_hud.dart';
import 'package:skeleton_walk/overlays/setting_overlay.dart';
import 'package:skeleton_walk/skeleton_game/flame_game_audio_manager.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';
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
                    'Skeleton Walk',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'BlackShepherd',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      gameReference.startGame();
                      gameReference.overlays.remove(MainMenuOverLay.id);
                      gameReference.overlays.add(GameHud.id);
                      FGAudioManager.instance
                          .playSfx(SfxAudioEvent.buttonClick);
                    },
                    child: const Text(
                      'Play',
                      style:
                          TextStyle(fontSize: 30, fontFamily: 'BlackShepherd'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      gameReference.overlays.remove(MainMenuOverLay.id);
                      gameReference.overlays.add(SettingOverlay.id);
                      FGAudioManager.instance
                          .playSfx(SfxAudioEvent.buttonClick);
                    },
                    child: const Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 30, fontFamily: 'BlackShepherd'),
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
