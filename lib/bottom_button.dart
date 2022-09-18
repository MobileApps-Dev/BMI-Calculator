import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  BottomButton(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          color: const Color(0xFFEB1555),
          margin: const EdgeInsets.only(top: 10),
          padding:const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 80,
          child: Center(
            child: Text(
              title,
              style: buttonTextStyle,
            ),
          )),
    );
  }
}
