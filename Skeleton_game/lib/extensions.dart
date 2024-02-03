import 'package:skeleton_walk/overlays/game_hud.dart';
import 'package:skeleton_walk/overlays/main_menu_overlay.dart';
import 'package:skeleton_walk/overlays/pause_overlay.dart';
import 'package:skeleton_walk/skeleton_game/flame_game_audio_manager.dart';
import 'package:skeleton_walk/skeleton_game/skeleton.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';

extension SkeletonGameReferenceExtension on SkeletonGame {
  void exitGameToMainMenu() {
    // Sound
    FGAudioManager.instance.playSfx(SfxAudioEvent.buttonClick);
    FGAudioManager.instance.stopBgm();
    // Event
    resumeEngine();
    reset();
    overlays.add(MainMenuOverLay.id);
  }

  void startSkeletonWalk(
      {bool isResetRequired = false, bool isResumeEngineRequired = false}) {
    // Sound
    FGAudioManager.instance.playSfx(SfxAudioEvent.buttonClick);
    FGAudioManager.instance.resumeBgm();

    // Data
    playerData.lives = 5;
    playerData.currentState = SkeletonState.walk;
    playerData.currentScore = 0;

    // Events
    if (isResetRequired) {
      reset();
    }

    if (isResumeEngineRequired) {
      resumeEngine();
    }

    overlays.add(GameHud.id);
    startGame();
  }

  void pauseGamePlay() {
    // Sound
    FGAudioManager.instance.pauseBgm();
    FGAudioManager.instance.playSfx(SfxAudioEvent.buttonClick);
    // Event
    overlays.remove(GameHud.id);
    overlays.add(PauseOverlay.id);
    pauseEngine();
  }
}
