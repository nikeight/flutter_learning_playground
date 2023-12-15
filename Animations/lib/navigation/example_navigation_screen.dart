import 'package:animations/navigation/hero_navigation_list_screen.dart';
import 'package:flutter/material.dart';

class NavigationExampleScreen extends StatelessWidget {
  const NavigationExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Text('Learn about Offsets'),
      ),
    );
  }
}
