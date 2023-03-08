import 'package:cat_api/presentation/breed/ui/screen/breed_screen.dart';
import 'package:cat_api/presentation/global/animations/animations.dart';
import 'package:cat_api/presentation/global/global_widgets/CustomText.dart';
import 'package:flutter/material.dart';

class InfoBreed extends StatelessWidget {
  const InfoBreed({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final breed = BreedScreenProvide.of(context).breed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const SlideDownAnimation(
              duration: Duration(milliseconds: 400),
              child:  CustomText(
                text: "Life Span", 
                textAlign: TextAlign.start, 
                textSize: 20,
                withBold: true,
              ),
            ),
            const SizedBox(height: 10,),
            SlideDownAnimation(
              duration: const Duration(milliseconds: 450),
              child: CustomText(
                text: "${breed.lifeSpan} years", 
                textAlign: TextAlign.start, 
                textSize: 15,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        ),
        Column(
          children: [
            const SlideDownAnimation(
              duration: Duration(milliseconds: 500),
              child:  CustomText(
                text: "Weight", 
                textAlign: TextAlign.start, 
                textSize: 20,
                withBold: true,
              ),
            ),
            const SizedBox(height: 10,),
            SlideDownAnimation(
              duration: const Duration(milliseconds: 550),
              child: CustomText(
                text: "${breed.weight.imperial} kg", 
                textAlign: TextAlign.start, 
                textSize: 15,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        )
      ],
    );
  }
}
