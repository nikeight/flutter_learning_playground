import 'package:animations/hero/team_card_view.dart';
import 'package:flutter/material.dart';

class HeroCardView extends StatelessWidget {
  final SuperHero superHero;
  final Function() onClickedListener;

  const HeroCardView(
      {super.key, required this.superHero, required this.onClickedListener});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClickedListener();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 300,
        height: 300,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.all(8),
          child: Stack(
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(superHero.heroImageAsset),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(8),
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black26, Colors.black12],
                        stops: [0, 0.5]),
                  ),
                  child: Image.asset(
                    superHero.iconImageAsset,
                    width: 40,
                    height: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
