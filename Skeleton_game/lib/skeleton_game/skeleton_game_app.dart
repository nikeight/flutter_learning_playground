import 'package:skeleton_walk/overlays/game_hud.dart';
import 'package:skeleton_walk/overlays/game_over_overlay.dart';
import 'package:skeleton_walk/overlays/main_menu_overlay.dart';
import 'package:skeleton_walk/overlays/pause_overlay.dart';
import 'package:skeleton_walk/overlays/setting_overlay.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

SkeletonGame _skeletonGame = SkeletonGame();

class SkeletonGameApp extends StatelessWidget {
  const SkeletonGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'BlackShepherd',
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Settings up some default theme for elevated buttons.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            fixedSize: const Size(200, 60),
          ),
        ),
      ),
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
