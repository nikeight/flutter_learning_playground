import 'package:first_flutter_project/models/player_data.dart';
import 'package:first_flutter_project/models/settings_data.dart';
import 'package:first_flutter_project/skeleton_game/skeleton_game_app.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  // Ensures that all bindings are initialized
  // before was start calling hive and flame code
  // dealing with platform channels.
  WidgetsFlutterBinding.ensureInitialized();

  // Makes the game full screen and landscape only.
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  await _initHive();
  runApp(const SkeletonGameApp());
}

Future<void> _initHive() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  
  Hive.registerAdapter<PlayerData>(PlayerDataAdapter());
  Hive.registerAdapter<SettingsData>(SettingsDataAdapter());
}
