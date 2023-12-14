import 'package:flutter/material.dart';

class TeamCardView extends StatelessWidget {
  final DcTeam teamInfo;
  final Function(DcTeam) onTeamClicked;

  const TeamCardView(
      {super.key, required this.teamInfo, required this.onTeamClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTeamClicked(teamInfo);
      },
      child: Card(
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              teamInfo.imageAsset,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Text(
              teamInfo.teamName,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

class DcTeam {
  final String teamName;
  final String imageAsset;

  DcTeam(this.teamName, this.imageAsset);
}

class SuperHero {
  final String name;
  final String iconImageAsset;
  final String heroImageAsset;
  final Offset offset;

  SuperHero(this.name, this.iconImageAsset, this.heroImageAsset, this.offset);
}