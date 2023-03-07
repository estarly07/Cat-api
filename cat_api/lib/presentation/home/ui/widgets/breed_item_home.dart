import 'package:cat_api/presentation/global_widgets/global_widgets.dart';
import 'package:cat_api/presentation/home/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';

class BreedItemHome extends StatelessWidget {
  final Size size;
  const BreedItemHome({
    Key? key,
    required this.size
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.02,),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FadeInImage(
            placeholder: const AssetImage("assets/images/no_image.jpg"),
            image: NetworkImage("https://www.purina-arabia.com/sites/default/files/2020-12/Understanding%20Your%20Cat%27s%20Body%20LanguageTEASER.jpg"),
            fit: BoxFit.cover,
                height: size.height * 0.3,
          ),
        ),
        SizedBox(height: size.height * 0.02,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                child: CustomText(
                  text: "Namessssssssssssssssssssssssssssssssssssssssss", 
                  color: Colors.black, 
                  textAlign: TextAlign.start, 
                  withBold: true,
                  textSize: 20
                ),
              ),
              SizedBox(width: 5,),
              CustomTextIcon(
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
          child: CustomText(
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