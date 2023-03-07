import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomError extends StatelessWidget {
  final String lottieAnimation;
  final Function onRefresh;
  const CustomError({Key? key,required this.lottieAnimation,required this.onRefresh}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(lottieAnimation,fit: BoxFit.contain),
        InkWell(
          onTap: () => onRefresh(),
          child: const Icon(Icons.refresh,size: 30,))
      ],
    );
  }
}