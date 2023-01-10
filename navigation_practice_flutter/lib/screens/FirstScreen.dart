
import 'package:flutter/material.dart';
import 'package:navigation_practice_flutter/screens/SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "First Screen"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen(
                  name: "Niket, push to third screen",
                  age: "23",
                ))
            );
          },
          child: const Text("Push to Second Screen"),
        ),
      ),
    );
  }
}
