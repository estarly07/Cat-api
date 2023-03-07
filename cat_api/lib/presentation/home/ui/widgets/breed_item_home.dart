import 'package:cat_api/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class BreedItemHome extends StatelessWidget {
  final Size size;
  final bool wait;
  final String? breed;
  const BreedItemHome({
    Key? key,
    required this.size, 
    required this.wait, 
    required this.breed
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.02,),
        _Image(wait: wait, size: size),
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
              : const Flexible(
                child: CustomText(
                  text: "Namessssssssssssssssssssssssssssssssssssssssss", 
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
              : const CustomTextIcon(
                image: "assets/images/ic_brain.png",
                color: Colors.black,
                text: "1/5",
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
              text: "Originssssssssssssssssssssssssssssssssssssssssss", 
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
  }) : super(key: key);

  final bool wait;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: wait ? 
      CustomBackgroundWait(
        widget: Container( height: size.height * 0.3,), 
        corners: 0, 
        margin: EdgeInsets.zero
      )
      :FadeInImage(
        placeholder: const AssetImage("assets/images/no_image.jpg"),
        image: NetworkImage("https://www.purina-arabia.com/sites/default/files/2020-12/Understanding%20Your%20Cat%27s%20Body%20LanguageTEASER.jpg"),
        fit: BoxFit.cover,
            height: size.height * 0.3,
      ),
    );
  }
}