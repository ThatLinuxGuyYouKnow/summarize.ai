import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  ReusableButton({super.key, required this.label, required this.onPressed});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonWidth = screenWidth * .9;
    if (screenWidth >= 900) {
      buttonWidth = screenWidth * .1;
    }
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: buttonWidth,
          height: screenHeight * 0.077,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              label,
              style: GoogleFonts.ubuntu(
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
        ));
  }
}
