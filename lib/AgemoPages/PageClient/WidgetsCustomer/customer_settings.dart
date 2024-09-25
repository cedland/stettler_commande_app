import 'package:flutter/material.dart';

class CustomerSettings extends StatelessWidget {
  const CustomerSettings({super.key, required this.icon, required this.text, required this.onPressed});

  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.symmetric( vertical: screenHeight/100),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(icon, size: 26,),
                 SizedBox(width: screenWidth/36,),
                Text(text, style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
