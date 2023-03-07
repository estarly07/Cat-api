import 'package:cat_api/presentation/global/animations/animations.dart';
import 'package:flutter/material.dart';

class DialogBreed extends StatelessWidget {
  final Size size;
  final String? image;
  final String tagHero;
  const DialogBreed({
    Key? key,
    required this.size,required this.image, required this.tagHero
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tagHero,
      child: FadeInAnimation(
        duration: const Duration(milliseconds: 300),
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          child: Wrap(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: size.height *0.05),
                child: FadeInImage(
                    placeholder: const AssetImage("assets/images/no_image.jpg"),
                    image: NetworkImage("$image"),
                    imageErrorBuilder: (context, url, error) => Image.asset("assets/images/no_image.jpg"),
                    fit: BoxFit.cover,
                        height: size.height * 0.4,
                        width: double.infinity,
                  ),
              ),
            ],
          )),
      ),
    );
  }
}