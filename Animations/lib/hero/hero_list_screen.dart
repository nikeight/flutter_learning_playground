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
        title: const Text('Hero Animation'),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.47,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(team.imageAsset),
            ),
          ),
          Center(
            child: Hero(
              flightShuttleBuilder: (flightContext,
                  animation,
                  flightDirection,
                  fromHeroContext,
                  toHeroContext,) {
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
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(4), // Border radius
                  child: ClipOval(
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(team.logoAsset))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
