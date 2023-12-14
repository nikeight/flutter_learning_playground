import 'package:animations/hero/hero_list_screen.dart';
import 'package:animations/hero/team_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimation extends StatelessWidget {
  HeroAnimation({super.key});

  final teamList = [
    DcTeam('JL', 'assets/image/flash_logo.png'),
    DcTeam('SS', 'assets/image/flash_logo.png'),
    DcTeam('DP', 'assets/image/flash_logo.png'),
    DcTeam('TT', 'assets/image/flash_logo.png'),
  ];

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    final gridItemViewWidth = MediaQuery.of(context).size.width / 2;

    return Center(
      child: SizedBox(
        width: gridItemViewWidth,
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: ScrollController(keepScrollOffset: false),
          children: List.generate(
            teamList.length,
            (index) {
              final indexTeam = teamList[index];
              return Hero(
                tag: indexTeam.teamName,
                child: TeamCardView(
                  teamInfo: indexTeam,
                  onTeamClicked: (teamSelected) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HeroListScreen(
                          team: indexTeam,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
