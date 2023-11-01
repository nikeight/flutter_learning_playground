import 'package:first_flutter_project/skeleton_game/skeleton_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

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
          game: SkeletonGame(),
        ),
      ),
    );
  }
}
