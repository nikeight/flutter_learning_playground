import 'package:animations/hero/team_card_view.dart';
import 'package:flutter/material.dart';

class HeroListScreen extends StatelessWidget {
  final DcTeam team;

  const HeroListScreen({super.key, required this.team});

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
      body: const Center(
        child: Text('Hero Animation working fine or not?'),
      ),
    );
  }
}
