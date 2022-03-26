import 'package:flutter/material.dart';
import '../../model/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.iconName, required this.stringLabel})
      : super(key: key);

  final IconData iconName;
  final String stringLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 80.0,
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          stringLabel,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
