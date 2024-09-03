import 'package:flutter/material.dart';

class SummarizeButton extends StatelessWidget {
  final VoidCallback onTapped;
  SummarizeButton({super.key, required this.onTapped});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight * 0.06,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Summarize',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ));
  }
}
