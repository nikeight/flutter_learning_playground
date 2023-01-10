import 'package:flutter/material.dart';
import 'package:navigation_practice_flutter/screens/ThirdScreen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({required this.name, required this.age});

  final String name;
  final String age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final someComplexData = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const ThirdScreen(name: "Niket", age: "23")));
            print(someComplexData);
          },
          child: Text(name),
        ),
      ),
    );
  }
}
