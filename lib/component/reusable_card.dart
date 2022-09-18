import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget childCard;
  final VoidCallback onPress;

  // ignore: use_key_in_widget_constructors
  const ReusableCard(this.color, this.childCard, this.onPress);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        child: childCard,
      ),
    );
  }
}
