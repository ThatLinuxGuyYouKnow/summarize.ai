import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final double? borderWidth;
  final Color? borderColor;
  final Function(String)? onChanged;

  const ReusableTextField({
    Key? key,
    this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderWidth,
    this.borderColor,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerWidth = screenWidth * 0.9;
    double containerHeight = screenHeight * 2;
    if (screenHeight >= 500) {
      containerHeight = screenHeight * .25;
    }
    if (screenWidth >= 900) {
      containerWidth = screenWidth * 0.3;
    }

    return Container(
      height: 50, // Fixed height for the input field
      width: containerWidth, // Use the calculated width here
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth ?? 1.0,
          color: borderColor ?? Colors.grey,
        ),
        color: Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          if (prefixIcon != null) prefixIcon!,
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
