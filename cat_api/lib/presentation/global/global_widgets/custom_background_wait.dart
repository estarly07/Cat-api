import 'package:flutter/material.dart';

class CustomBackgroundWait extends StatelessWidget {
  final double corners;
  final Widget widget;
  final EdgeInsetsGeometry margin;
  const CustomBackgroundWait({
    Key? key,
    required this.widget,
    required this.corners,
    required this.margin,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(corners)
      ),
      child: widget,
    );
  }
}