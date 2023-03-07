import 'package:cat_api/presentation/global/global_widgets/global_widgets.dart';
import 'package:cat_api/presentation/home/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';

class BreedItemHome extends StatelessWidget {
  const BreedItemHome({ Key? key,}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    final size  = BreedItemProvider.of(context).size;
    final wait  = BreedItemProvider.of(context).wait;
    final breed = BreedItemProvider.of(context).breed;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.02,),
        _Image(wait: wait, size: size, image : breed?.referenceImageId),
        SizedBox(height: size.height * 0.02,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              wait? 
              const CustomBackgroundWait(
                widget: SizedBox(height: 20, width: 100,), 
                corners: 20, 
                margin: EdgeInsets.zero
              )
              :  Flexible(
                child: CustomText(
                  text: breed?.name ?? "N.N", 
                  color: Colors.black, 
                  textAlign: TextAlign.start, 
                  withBold: true,
                  textSize: 20
                ),
              ),
              const SizedBox(width: 5,),
              wait ?
              const CustomBackgroundWait(
                widget: SizedBox(height: 20, width: 50,), 
                corners: 20, 
                margin: EdgeInsets.zero
              )
              :  CustomTextIcon(
                image: "assets/images/ic_brain.png",
                color: Colors.black,
                text: "${breed?.intelligence ?? 1}/5",
                textSize: 15,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:size.width * 0.05,vertical: size.height * 0.005),
          child: wait? 
          const CustomBackgroundWait(
                widget: SizedBox(height: 15, width: 100,), 
                corners: 20, 
                margin: EdgeInsets.zero
              )
          : CustomText(
              text: breed?.origin ?? "", 
              color: Colors.grey.shade500, 
              textAlign: TextAlign.start, 
              textSize: 15
          ),
        )
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.wait,
    required this.size,
    required this.image,
  }) : super(key: key);

  final bool wait;
  final Size size;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 15),
          )]
        ),
      child: InkWell(
        onLongPress: ()=>  BreedItemProvider.of(context).onTapLongPress(BreedItemProvider.of(context).breed!),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: wait ? 
          CustomBackgroundWait(
            widget: Container( height: size.height * 0.3,), 
            corners: 0, 
            margin: EdgeInsets.zero
          )
          : Hero(
            tag: BreedItemProvider.of(context).breed!.id,
            child: FadeInImage(
              placeholder: const AssetImage("assets/images/no_image.jpg"),
              image: NetworkImage("$image"),
              imageErrorBuilder: (context, url, error) => Image.asset("assets/images/no_image.jpg"),
              fit: BoxFit.cover,
                  height: size.height * 0.3,
                  width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}