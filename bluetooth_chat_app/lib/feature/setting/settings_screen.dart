import 'package:bluetooth_chat_app/feature/setting/switch_component.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SwitchComponent(
            properties: 'Save Messages',
            onSwitchToggle: (value) {},
            description: 'This will cache all the chat messages',
            currentValue: false,
          ),
          SwitchComponent(
            properties: 'Disappear Message',
            onSwitchToggle: (value) {},
            description: 'Message Disappear after 7 days',
            currentValue: false,
          ),
          SwitchComponent(
            properties: 'Notifications',
            onSwitchToggle: (value) {},
            description: 'Receive notifications for unread messages.',
            currentValue: false,
          ),
          SwitchComponent(
            properties: 'Images Support',
            onSwitchToggle: (value) {},
            description: 'Send low quality images',
            currentValue: false,
          ),
          SwitchComponent(
            properties: 'Switch To Bluetooth',
            onSwitchToggle: (value) {},
            description: 'Chat using Bluetooth',
            currentValue: true,
          ),
          SwitchComponent(
            properties: 'Switch To Server',
            onSwitchToggle: (value) {},
            description: 'Chat using Server',
            currentValue: false,
          ),
        ],
      ),
    );
  }
}
