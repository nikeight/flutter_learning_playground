import 'package:bluetooth_chat_app/feature/scan/component/search_device_component.dart';
import 'package:bluetooth_chat_app/feature/scan/model/SearchDevice.dart';
import 'package:bluetooth_chat_app/feature/scan/providers/ble_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchDeviceScreen extends StatefulHookConsumerWidget {
  const SearchDeviceScreen({super.key});

  @override
  ConsumerState<SearchDeviceScreen> createState() => _SearchDeviceScreenState();
}

class _SearchDeviceScreenState extends ConsumerState<SearchDeviceScreen> {
  bool isBluetoothTurnedOn = false;
  bool isScanning = false;
  List<ScanResult> scanResults = [];

  @override
  void initState() {
    final bleManager = ref.read(flutterBluePlusProvider);

    FlutterBluePlus.adapterState.listen((state) {
      setState(() {
        isBluetoothTurnedOn = state == BluetoothAdapterState.on;
      });
    });

    FlutterBluePlus.isScanning.listen((scanning) {
      setState(() => isScanning = scanning);
    });

    FlutterBluePlus.scanResults.listen((results) {
      setState(() => scanResults = results);
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    useEffect(
          () {
        if (isBluetoothTurnedOn) requestPermissions(areAllPermissionsGranted);
        return null;
      },
      [isBluetoothTurnedOn],
    );

    useEffect(
          () {
        if (isBluetoothTurnedOn && areAllPermissionsGranted.value) {
          FlutterBluePlus.startScan(
            withServices: [],
            timeout: const Duration(seconds: 30),
          );
        }
        return null;
      },
      [isBluetoothTurnedOn, areAllPermissionsGranted.value],
    );

    useEffect(
          () {
        if (scanResults.isNotEmpty) {
          scanResults.firstNonBondedDeviceOrNull.then(
                (deviceResult) {
              if (deviceResult != null) {
                logger.d('Found device: $deviceResult');
                foundDevice.value = deviceResult;
                bluetoothManager.stopScan();
                deviceResult.device.connect().then((_) {
                  context.push(const DeviceFoundView());
                });
              }
            },
          );
        }
        return null;
      },
      [scanResults],
    );

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
