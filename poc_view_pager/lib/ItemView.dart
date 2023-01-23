import 'package:flutter/material.dart';
import 'package:poc_view_pager/MusicAlbum.dart';

class ViewPagerItemView extends StatelessWidget {
  final MusicAlbum indexOfThePage;
  final Color colors;

  const ViewPagerItemView({super.key, required this.indexOfThePage, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Text(
            "This is ${indexOfThePage.albumName}",
          style: const TextStyle(
            fontSize: 10
          ),
        ),
      ),
    );
  }
}
