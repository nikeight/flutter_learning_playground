import 'package:first_flutter_project/overlays/game_hud.dart';
import 'package:first_flutter_project/overlays/game_over_overlay.dart';
import 'package:first_flutter_project/overlays/main_menu_overlay.dart';
import 'package:first_flutter_project/overlays/pause_overlay.dart';
import 'package:first_flutter_project/overlays/setting_overlay.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

SkeletonGame _skeletonGame = SkeletonGame();

class SkeletonGameApp extends StatelessWidget {
  const SkeletonGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Audiowide'),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        body: GameWidget(
          overlayBuilderMap: {
            MainMenuOverLay.id: (_, SkeletonGame gameRef) =>
                MainMenuOverLay(gameReference: gameRef),
            GameHud.id: (_, SkeletonGame gameRef) => GameHud(gameRef),
            PauseOverlay.id: (_, SkeletonGame gameRef) => PauseOverlay(gameRef),
            SettingOverlay.id: (_, SkeletonGame gameRef) =>
                SettingOverlay(gameRef),
            GameOverOverlay.id: (_, SkeletonGame gameRef) =>
                GameOverOverlay(gameRef),
          },
          initialActiveOverlays: const [MainMenuOverLay.id],
          game: _skeletonGame,
        ),
      ),
    );
  }
}
