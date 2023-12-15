import 'package:flutter/material.dart';

class ShowCodeSnippetWidget extends StatelessWidget {
  final String codeSnippetImageAsset;

  const ShowCodeSnippetWidget({super.key, required this.codeSnippetImageAsset});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width * 0.85;
    final imageHeight = MediaQuery.of(context).size.height * 0.85;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: widthScreen,
          height: imageHeight,
          child: Image.asset(codeSnippetImageAsset),
        ),
      ),
    );
  }
}
