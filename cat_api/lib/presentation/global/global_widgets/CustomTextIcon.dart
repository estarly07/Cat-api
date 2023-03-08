import 'package:cat_api/presentation/global/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class CustomTextIcon extends StatelessWidget {
  final String image;
  final String text;
  final Color?  color;
  final double textSize;
  const CustomTextIcon(
      {Key? key,
      required this.image,
      required this.text,
      this.color,
      required this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image,height: 25),
        const SizedBox(width: 5,),
        CustomText(
            text: text,
            color: color,
            textAlign: TextAlign.start,
            textSize: textSize)
      ],
    );
  }
}
