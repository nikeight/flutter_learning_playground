import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'settings_data.g.dart';

@HiveType(typeId: 1)
class SettingsData extends ChangeNotifier with HiveObjectMixin {

  static const String settingsDataHiveKey = 'settings_data';

  SettingsData(
      {bool bgm = false, bool sfx = false, bool halloweenMode = false}) {
    _bgm = bgm;
    _sfx = sfx;
    _halloweenMode = halloweenMode;
  }

  @HiveField(0)
  bool _bgm = false;

  bool get bgm => _bgm;

  set bgm(bool value) {
    _bgm = value;
    notifyListeners();
    save();
  }

  @HiveField(1)
  bool _sfx = false;

  bool get sfx => _sfx;

  set sfx(bool value) {
    _sfx = value;
    notifyListeners();
    save();
  }

  @HiveField(2)
  bool _halloweenMode = false;

  bool get halloweenMode => _halloweenMode;

  set halloweenMode(bool value) {
    _halloweenMode = value;
    notifyListeners();
    save();
  }
}
