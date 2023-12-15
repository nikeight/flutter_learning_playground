import 'package:animations/navigation/hero_detail_page.dart';
import 'package:animations/hero/team_card_view.dart';
import 'package:animations/navigation/hero_vertical_card_view.dart';
import 'package:flutter/material.dart';

class HeroNavigationListScreen extends StatelessWidget {
  final heroList = [
    SuperHero('Batman', 'assets/image/batman_logo.png',
        'assets/image/batman_cover.jpeg', const Offset(0.0, 1.0)),
    SuperHero('Superman', 'assets/image/superman_logo.png',
        'assets/image/superman_cover.jpg', const Offset(0.0, -1.0)),
    SuperHero('Flash', 'assets/image/flash_new_logo.png',
        'assets/image/flash_cover.jpeg', const Offset(1.0, 0.0)),
    SuperHero('Batman', 'assets/image/batman_logo.png',
        'assets/image/batman_cover.jpeg', const Offset(-1.0, 0.0)),
    SuperHero('Superman', 'assets/image/superman_logo.png',
        'assets/image/superman_cover.jpg', const Offset(0.0, -1.0)),
    SuperHero('Flash', 'assets/image/flash_new_logo.png',
        'assets/image/flash_cover.jpeg', const Offset(1.0, 0.0)),
    SuperHero('Batman', 'assets/image/batman_logo.png',
        'assets/image/batman_cover.jpeg', const Offset(0.0, 1.0)),
    SuperHero('Superman', 'assets/image/superman_logo.png',
        'assets/image/superman_cover.jpg', const Offset(0.0, -1.0)),
    SuperHero('Flash', 'assets/image/flash_new_logo.png',
        'assets/image/flash_cover.jpeg', const Offset(1.0, 0.0)),
  ];

  HeroNavigationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(heroList.length, (index) {
                final heroSelected = heroList[index];
                return HeroCardView(
                  superHero: heroSelected,
                  onClickedListener: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          HeroDetailPage(superHeroDetails: heroSelected),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final begin = heroSelected.offset;
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ));
                  },
                );
              }),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '⦿ `SlideTransition` -- FooTransition',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '⦿ Explicit Animation',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '⦿ EaseIn Curves',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '⦿ OffSet Transition',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '1️⃣ OffSet (1.0, 0.0) ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '2️⃣ OffSet (0.0, -1.0) ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '3️⃣ OffSet (-1.0, 0.0) ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '4️⃣ OffSet (0.0, -1.0) ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}
