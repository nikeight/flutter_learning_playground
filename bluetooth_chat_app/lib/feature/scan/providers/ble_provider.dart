import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ble_provider.g.dart';

@riverpod
FlutterBluePlus flutterBluePlus(FlutterBluePlusRef ref){
  return FlutterBluePlus();
}

class SomethingFound {


  Future<void> test() async {

  }
}