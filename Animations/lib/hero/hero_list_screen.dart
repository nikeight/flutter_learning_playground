import 'package:animations/hero/team_card_view.dart';
import 'package:flutter/material.dart';

class HeroListScreen extends StatelessWidget {
  final DcTeam team;

  const HeroListScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hero Animation Example',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.normal,
            fontSize: 36,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.47,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(team.imageAsset),
                ),
              ),
              Center(
                child: Hero(
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
          const SizedBox(height: 40),
          const Text(
            '⦿ Wrap Child Widget with Hero Widget',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '⦿ Relation of similar data',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '⦿ Identify based on Key, same Key ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '⦿ Internally Use TweenAnimation',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
