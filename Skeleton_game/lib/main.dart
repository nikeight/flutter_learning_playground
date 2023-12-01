import 'package:first_flutter_project/skeleton_game/skeleton_game_app.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  // Ensures that all bindings are initialized
  // before was start calling hive and flame code
  // dealing with platform channels.
  WidgetsFlutterBinding.ensureInitialized();

  // Makes the game full screen and landscape only.
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(const SkeletonGameApp());
}
