import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String    text;
  final Color     color;
  final bool      withOverflow;
  final bool      withBold;
  final TextAlign textAlign;
  final double    textSize;

  const CustomText({
    Key? key, 
    required this.text, 
    required this.color, 
    required this.textAlign,
    required this.textSize,
    this.withOverflow = true, 
    this.withBold     = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: withBold? FontWeight.bold : FontWeight.normal,
        color: color,
        fontSize: textSize,
        overflow:  withOverflow? TextOverflow.ellipsis : null,
      ),
    );
  }
}