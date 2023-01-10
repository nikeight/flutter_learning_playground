import 'package:flutter/material.dart';
import 'package:state_less_and_state_full_tactice/state_practice/ParentWidget.dart';
import 'package:state_less_and_state_full_tactice/state_practice/ParentWidgetState.dart';
import 'package:state_less_and_state_full_tactice/state_practice/TapBoxA.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          // child: TapBoxA(),
          child: ParentWidgetState(),
        ),
      ),
    );
  }
}
