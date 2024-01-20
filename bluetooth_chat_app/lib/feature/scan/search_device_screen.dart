import 'package:bluetooth_chat_app/feature/scan/component/search_device_component.dart';
import 'package:bluetooth_chat_app/feature/scan/model/SearchDevice.dart';
import 'package:flutter/material.dart';

class SearchDeviceScreen extends StatelessWidget {
  const SearchDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        ListView.builder(
          itemCount: dummyDeviceSearchList.length,
          itemBuilder: (context, index) {
            final device = dummyDeviceSearchList[index];
            return SearchDeviceComponent(
              device: device,
            );
          },
        )
      ],
    );
  }
}

final dummyDeviceSearchList = [
  SearchDevice(
    deviceId: '123:345:345',
    deviceName: "Android 12 Device",
    deviceProperties: "Send and Receive data",
  ),
];
