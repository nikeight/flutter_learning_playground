import 'package:animations/navigation/hero_navigation_list_screen.dart';
import 'package:flutter/material.dart';

class NavigationExampleScreen extends StatelessWidget {
  const NavigationExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HeroNavigationListScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.play_circle,
          size: 16,
          color: Colors.blue,
        ),
      ),
      body: const Center(
        child: Text('Learn about Offsets'),
      ),
    );
  }
}
