import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:skeleton_walk/skeleton_game/skeleton.dart';

part 'player_data.g.dart';

/// Keeping only the {highScore} locally save
/// Lives and current score reset everytime
@HiveType(typeId: 0)
class PlayerData extends ChangeNotifier with HiveObjectMixin {
  static const String playerDataHiveKey = 'player_data';

  @HiveField(0)
  int highScore = 0;

  int _lives = 1;

  int get lives => _lives;

  set lives(int value) {
    if (value <= 5 && value >= 0) {
      _lives = value;
      notifyListeners();
    }
  }

  int _currentScore = 0;

  int get currentScore => _currentScore;

  set currentScore(int value) {
    _currentScore = value;
    if (highScore < _currentScore) {
      highScore = _currentScore;
    }
    notifyListeners();
    save();
  }

  SkeletonState _currentState = SkeletonState.walk;

  SkeletonState get currentState => _currentState;

  set currentState(SkeletonState newState) {
    _currentState = newState;
    notifyListeners();
    save();
  }
}
