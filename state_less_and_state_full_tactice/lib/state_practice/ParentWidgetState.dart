import 'package:flutter/material.dart';
import 'TapBoxC.dart';

class ParentWidgetState extends StatefulWidget {
  const ParentWidgetState({Key? key}) : super(key: key);

  @override
  State<ParentWidgetState> createState() => _ParentWidgetStateState();
}

class _ParentWidgetStateState extends State<ParentWidgetState> {
  bool _isActive = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapBoxC(
        active: _isActive,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }
}
