import 'package:flutter/material.dart';

Widget TitleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: const Text(
              "Title Heading",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            "Title Sub heading",
            style: TextStyle(
              color: Colors.brown,
            ),
          )
        ],
      ),),
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      const Text("42")
    ],
  ),
);
