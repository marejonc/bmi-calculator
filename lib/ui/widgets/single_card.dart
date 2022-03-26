import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  const SingleCard(
      {Key? key, required this.cardColor, this.cardChild, this.isTop = false, this.onPress})
      : super(key: key);

  final Color cardColor;
  final Widget? cardChild;
  final bool isTop;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin:
            isTop ? const EdgeInsets.fromLTRB(12.0, 24.0, 12.0, 12.0) : const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
