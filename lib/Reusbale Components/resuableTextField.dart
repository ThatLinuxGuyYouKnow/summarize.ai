import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? borderColor;
  final Function(String)? onChanged;

  ReusableTextField({
    this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.height,
    this.width,
    this.borderWidth,
    this.borderColor,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: height ?? screenHeight * 0.08,
      width: width ?? screenWidth * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
            width: borderWidth ?? 0, color: borderColor ?? Colors.transparent),
        color: Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              prefixIcon ?? SizedBox.shrink(),
              Expanded(
                child: TextField(
                  controller: controller ?? null,
                  keyboardType: keyboardType,
                  obscureText: obscureText,
                  onChanged: onChanged, // And this line
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    suffixIcon: suffixIcon,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
