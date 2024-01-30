import 'dart:ui';
import 'package:skeleton_walk/models/settings_data.dart';
import 'package:skeleton_walk/overlays/main_menu_overlay.dart';
import 'package:skeleton_walk/skeleton_game/skeleton_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingOverlay extends StatelessWidget {
  static const id = 'SettingMenu';
  final SkeletonGame skeletonGameRef;

  const SettingOverlay(this.skeletonGameRef, {super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: skeletonGameRef.settingsData,
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.black.withAlpha(100),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Selector<SettingsData, bool>(
                      selector: (_, settings) => settings.bgm,
                      builder: (context, bgm, __) {
                        return SwitchListTile(
                          title: const Text(
                            'Music',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          value: bgm,
                          onChanged: (bool value) {
                            Provider.of<SettingsData>(context, listen: false)
                                .bgm = value;
                            // if (value) {
                            //   AudioManager.instance
                            //       .startBgm('8BitPlatformerLoop.wav');
                            // } else {
                            //   AudioManager.instance.stopBgm();
                            // }
                          },
                        );
                      },
                    ),
                    Selector<SettingsData, bool>(
                      selector: (_, settings) => settings.sfx,
                      builder: (context, sfx, __) {
                        return SwitchListTile(
                          title: const Text(
                            'Effects',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          value: sfx,
                          onChanged: (bool value) {
                            Provider.of<SettingsData>(context, listen: false)
                                .sfx = value;
                          },
                        );
                      },
                    ),
                    Selector<SettingsData, bool>(
                      selector: (_, settings) => settings.halloweenMode,
                      builder: (context, halloweenMode, __) {
                        return SwitchListTile(
                          title: const Text(
                            'Halloween Mode 💀',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          value: halloweenMode,
                          onChanged: (bool value) {
                            Provider.of<SettingsData>(context, listen: false)
                                .halloweenMode = value;
                          },
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        skeletonGameRef.overlays.remove(SettingOverlay.id);
                        skeletonGameRef.overlays.add(MainMenuOverLay.id);
                      },
                      child: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
