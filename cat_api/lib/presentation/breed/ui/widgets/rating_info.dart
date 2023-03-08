import 'package:cat_api/presentation/breed/ui/screen/breed_screen.dart';
import 'package:cat_api/presentation/global/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class RatingInfo extends StatelessWidget {
  const RatingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BreedScreenProvide.of(context).data;
    final size = BreedScreenProvide.of(context).size;
    return Column(
      children: [
        ...data
            .map((key, value) => MapEntry(
                key,
                Container(
                  margin: EdgeInsets.only(bottom: size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "$key $value/5",
                          textAlign: TextAlign.start,
                          textSize: 15,
                          color: Theme.of(context).colorScheme.secondary),
                      ClipRRect(
                        borderRadius: BorderRadius.circular( size.height),
                        child: 
                        TweenAnimationBuilder<double>(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.easeInOut,
                            tween: Tween<double>(
                                begin: 0,
                                end: value.toDouble(),
                            ),
                            builder: (context, value, _) =>
                                LinearProgressIndicator(
                                  backgroundColor: Theme.of(context).backgroundColor,
                                  value: value.toDouble() / 5,
                                  minHeight: size.height * 0.02,
                                  color: Colors.orange.shade500,
                                ),
                        ),
                      ),
                    ],
                  ),
                )))
            .values
            .toList(),
      ],
    );
  }
}
