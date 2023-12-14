import 'package:animations/hero/team_card_view.dart';
import 'package:flutter/material.dart';

class HeroDetailPage extends StatelessWidget {
  final SuperHero superHeroDetails;

  const HeroDetailPage({super.key, required this.superHeroDetails});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final imageHeight = MediaQuery.of(context).size.height * 0.98;
    return Scaffold(
      appBar: AppBar(
        title: Text(superHeroDetails.name),
      ),
      body: Center(
        child: SizedBox(
          width: widthScreen,
          height: imageHeight,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset(superHeroDetails.heroImageAsset),
          ),
        ),
      ),
    );
  }
}
