
import 'package:cat_api/presentation/breed/ui/screen/breed_screen.dart';
import 'package:flutter/material.dart';

class HeaderBreed extends StatelessWidget {
  const HeaderBreed({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final breed = BreedScreenProvide.of(context).breed;
  final size  = BreedScreenProvide.of(context).size;
    return Stack(
      children: [
        Hero(
          tag: breed.id,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
            child: FadeInImage(
              placeholder: const AssetImage("assets/images/no_image.jpg"),
              image: NetworkImage("${breed.referenceImageId}"),
              imageErrorBuilder: (context, url, error) =>
                  Image.asset("assets/images/no_image.jpg"),
              fit: BoxFit.cover,
              height: size.height * 0.35,
              width: double.infinity,
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.05,
          left: size.width * 0.05,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)))
      ],
    );
  }
}