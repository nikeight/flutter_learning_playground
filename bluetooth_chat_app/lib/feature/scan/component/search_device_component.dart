import 'package:bluetooth_chat_app/feature/scan/model/SearchDevice.dart';
import 'package:flutter/material.dart';

class SearchDeviceComponent extends StatelessWidget {
  final SearchDevice device;

  const SearchDeviceComponent({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            device.deviceName,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                device.deviceProperties,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 10),
              ),
              Text(
                device.deviceId,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}
