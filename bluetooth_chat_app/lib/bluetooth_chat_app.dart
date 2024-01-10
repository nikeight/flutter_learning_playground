import 'package:bluetooth_chat_app/feature/home/home.dart';
import 'package:flutter/material.dart';

class BlueToothChatApp extends StatelessWidget {
  const BlueToothChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BluetoothChat',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
