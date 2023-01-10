import 'package:flutter/material.dart';
import 'package:state_less_and_state_full_tactice/state_practice/MyApp.dart';
import 'package:state_less_and_state_full_tactice/component/BottomBarSample.dart';
import 'package:state_less_and_state_full_tactice/component/TitleSection.dart';
import 'package:state_less_and_state_full_tactice/state_practice/TapBoxA.dart';
import 'component/ShoppingList.dart';
import 'model/Product.dart';

// void main() {
//   runApp(
//       const MaterialApp(
//     title: "Shopping App",
//     home: ShoppingList(products: [
//       Product(name: "LadyFinger"),
//       Product(name: "LadyFinger"),
//       Product(name: "LadyFinger"),
//     ]),
//   ));
// }

// void main() {
//   runApp(MaterialApp(
//     title: "Flutter UI tutorials",
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text("Toolbar Text"),
//       ),
//       body: Column(
//         children: [
//           Image.asset(
//             "images/android_puzzle.jpeg",
//             width: 300,
//             height: 240,
//             fit: BoxFit.cover,
//           ),
//           TitleSection,
//           bottomBar,
//         ],
//       ),
//     ),
//   ));
// }

void main(){
  runApp(
    const MyApp()
  );
}
