import 'package:cat_api/presentation/global/animations/slide_up_animation.dart';
import 'package:flutter/cupertino.dart';

class SlideDownAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Function(AnimationController)? controller;
  final double from;

  const SlideDownAnimation(
      {key,
      required this.child,
      this.duration = const Duration(milliseconds: 600),
      this.controller,
      this.from = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SlideUpAnimation(
        child: child,
        duration: duration,
        controller: controller,
        from: from * -1,
      );
}