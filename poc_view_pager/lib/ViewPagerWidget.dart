import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poc_view_pager/ItemView.dart';
import 'package:poc_view_pager/MusicAlbum.dart';



class ViewPagerWidget extends StatelessWidget {
  const ViewPagerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    var listOfColor = [Colors.cyan, Colors.yellow, Colors.grey, Colors.purple];

    final listOfSongs = List<MusicAlbum>.generate(
        100,
            (index) => MusicAlbum("Album $index", false,
            listOfColor[random.nextInt(listOfColor.length)]));

    final pageController = PageController(initialPage: 0);

    return PageView.builder(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        print("At Index $index ${listOfSongs[index].albumName}");
      },
      itemBuilder: (BuildContext context, int index) {
        final currentItem = listOfSongs[index];
        return ViewPagerItemView(
            indexOfThePage: currentItem, colors: currentItem.color);
      },
    );
  }
}
