import 'package:first_flutter_project/models/settings_data.dart';
import 'package:flame_audio/flame_audio.dart';


/// Audio Manager for the complete game,
/// Talks with Flame Audio API and provide control over Audios
class FGAudioManager {
  late SettingsData settingsData;

  FGAudioManager._initInternal();

  static final FGAudioManager _instance = FGAudioManager._initInternal();

  static FGAudioManager instance = _instance;

  Future<void> initAudioManager(
      List<String> cachingFiles, SettingsData settingsData) async {
    this.settingsData = settingsData;
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll(cachingFiles);
  }

  // Starts the given audio file as BGM on loop.
  void startBgm(String fileName) {
    if (settingsData.bgm) {
      FlameAudio.bgm.play(fileName, volume: 0.4);
    }
  }

  // Pauses currently playing BGM if any.
  void pauseBgm() {
    if (!settingsData.bgm) {
      FlameAudio.bgm.pause();
    }
  }

  // Resumes currently paused BGM if any.
  void resumeBgm() {
    if (settingsData.bgm) {
      FlameAudio.bgm.resume();
    }
  }

  // Stops currently playing BGM if any.
  void stopBgm() {
    FlameAudio.bgm.stop();
  }

  // Plays the given audio file once.
  void playSfx(String fileName) {
    if (settingsData.sfx) {
      FlameAudio.play(fileName);
    }
  }
}
