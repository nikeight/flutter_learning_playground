import 'package:animations/hero/hero_list_screen.dart';
import 'package:animations/hero/team_card_view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;

class HeroAnimation extends StatelessWidget {
  HeroAnimation({super.key});

  final teamList = [
    DcTeam('WM', 'assets/image/watchmen_logo.png',
        'assets/image/watch_men_team.jpg'),
    DcTeam('TT', 'assets/image/teens_titan_logo.png',
        'assets/image/teen_titan_team.jpg'),
    DcTeam('SS', 'assets/image/suicide_square_logo.jpg',
        'assets/image/ss_team.jpeg'),
    DcTeam('JL', 'assets/image/jl_logo.jpg',
        'assets/image/justice_league_team.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    // timeDilation = 1;
    final gridItemViewWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Center(
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
      ),
    );
  }
}
