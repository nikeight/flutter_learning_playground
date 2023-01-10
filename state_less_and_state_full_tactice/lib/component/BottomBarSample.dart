import 'package:flutter/material.dart';
import 'package:state_less_and_state_full_tactice/component/BottomBarButtomColumn.dart';

Row bottomBar = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    bottomBarButtonColumn(Colors.purple, Icons.call, "Call"),
    bottomBarButtonColumn(Colors.purple, Icons.near_me, "Route"),
    bottomBarButtonColumn(Colors.purple, Icons.share, "Share")
  ],
);