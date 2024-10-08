import 'package:skeleton_walk/models/settings_data.dart';
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
      FlameAudio.bgm.play(fileName, volume: 1.0);
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
  void playSfx(SfxAudioEvent event) {
    String audioFile = '';
    switch(event){
      case SfxAudioEvent.attack:
        audioFile = 'axe_swing.wav';
        break;
      case SfxAudioEvent.jump:
        audioFile = 'jump.wav';
        break;
      case SfxAudioEvent.hit:
        audioFile = 'hit.wav';
        break;
      case SfxAudioEvent.died:
        audioFile = 'dead.wav';
        break;
      case SfxAudioEvent.buttonClick:
        audioFile = 'button_click.wav';
        break;
    }
    if (settingsData.sfx) {
      FlameAudio.play(audioFile,volume: 1.0);
    }
  }
}

enum SfxAudioEvent{
  attack,
  jump,
  hit,
  died,
  buttonClick,
}
