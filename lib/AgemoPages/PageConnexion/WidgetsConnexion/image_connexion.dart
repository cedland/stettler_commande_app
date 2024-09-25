import 'package:flutter/material.dart';

class ImageConnexion extends StatelessWidget {
  const ImageConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight* 0.25,
      width: screenWidth,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/workers.png'),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(8)
      ),
    );
  }
}
