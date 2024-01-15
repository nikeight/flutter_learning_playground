import 'package:flutter/material.dart';

class SwitchComponent extends StatelessWidget {
  final String properties;
  final String description;
  final bool currentValue;
  final Function(bool value) onSwitchToggle;

  const SwitchComponent({
    super.key,
    required this.properties,
    required this.onSwitchToggle,
    required this.description,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                properties,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Switch.adaptive(
            activeColor: Colors.green,
            value: currentValue,
            onChanged: onSwitchToggle,
          )
        ],
      ),
    );
  }
}
