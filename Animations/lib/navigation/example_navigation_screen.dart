import 'package:animations/navigation/hero_navigation_list_screen.dart';
import 'package:flutter/material.dart';

class NavigationExampleScreen extends StatelessWidget {
  const NavigationExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width * 0.85;
    final imageHeight = MediaQuery.of(context).size.height * 0.85;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigation Example',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.normal,
            fontSize: 36,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HeroNavigationListScreen(),
            ),
          );
        },
        child: Icon(
          Icons.play_circle,
          size: 24,
          color: Colors.purple.shade400,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: widthScreen,
          height: imageHeight,
          child: Image.asset('assets/snippets/navigation_example_code.png'),
        ),
      ),
    );
  }
}
