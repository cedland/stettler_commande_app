import 'package:flutter/material.dart';

class LogoConnexion extends StatelessWidget {
  const LogoConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.grey[20],
      child: Image.asset(
        'assets/images/logo.png',
        height: screenHeight* 0.15,
        width: screenWidth * 0.25,
      ),
    );
  }
}
