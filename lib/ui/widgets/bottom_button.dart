import 'package:flutter/material.dart';
import '../../model/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.onTap, required this.textLabel}) : super(key: key);

  final VoidCallback onTap;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            textLabel,
            style: kLargeButtonTextStyle,
          ),
        ),
        width: double.infinity,
        height: 80.0,
        color: kBottomPanelColor,
        margin: const EdgeInsets.only(top: 12.0),
      ),
    );
  }
}
