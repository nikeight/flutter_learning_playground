
import 'package:flutter/material.dart';
import 'package:state_less_and_state_full_tactice/state_practice/TapBoxB.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({Key? key}) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  /// To Maintain a State
  bool _active = false;

  void _handleTapBoxChangedListener(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapBoxB(
        active : _active,
        onChanged : _handleTapBoxChangedListener,
      ),
    );
  }
}
