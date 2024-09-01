import 'package:flutter/material.dart';

class Manualsplash extends StatelessWidget {
  Manualsplash({super.key});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        children: [
          Container(
            height: screenHeight,
            color: Colors.purple,
          ),
          Center(
              child: SizedBox(
            height: screenHeight * 0.4,
            child: Image(
              image: AssetImage('assets/thumbnail.png'),
            ),
          ))
        ],
      ),
    );
  }
}
