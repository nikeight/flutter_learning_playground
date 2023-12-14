import 'package:animations/hero/team_card_view.dart';
import 'package:flutter/material.dart';

class HeroListScreen extends StatelessWidget {
  final DcTeam team;
  final heroList = [
    SuperHero('Batman', '', '', Offset.zero),
    SuperHero('Superman', '', '', Offset.zero),
    SuperHero('Flash', '', '', Offset.zero),
  ];

  HeroListScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).chain(
                        CurveTween(
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    child: toHeroContext.widget,
                  ),
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: fromHeroContext.widget,
                );
            }
          },
          tag: team.teamName,
          child: Image.asset(
            team.imageAsset,
            width: 36,
            height: 36,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: heroList.length,
        itemBuilder: (context, index) {
          final indexHero = heroList[index];
          return ListTile(
            onTap: () {
              // Do Nothing
            },
            leading: Hero(
              tag: indexHero.name,
              child: const Icon(
                Icons.headphones_rounded,
              ),
            ),
            title: Text(indexHero.name),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          );
        },
      ),
    );
  }
}
