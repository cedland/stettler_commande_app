import 'package:flutter/material.dart';
import 'package:stettler_livraison/AgemoPages/couleurs.dart';

class StyledButtons extends StatelessWidget {
  const StyledButtons(
      {super.key,
        required this.text,
        required this.onPressed,
        required this.color});

  final String text;
  final void Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          fixedSize:  Size(screenWidth/1.09, screenHeight/14.8),
          foregroundColor: appbarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'LatoBold',
          ),
        ),
      ),
    );
  }
}
