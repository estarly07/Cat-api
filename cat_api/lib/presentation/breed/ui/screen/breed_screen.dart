import 'package:cat_api/presentation/breed/ui/widgets/breed_widgets.dart';
import 'package:cat_api/presentation/global/animations/animations.dart';
import 'package:cat_api/presentation/global/global_widgets/global_widgets.dart';
import 'package:cat_api/presentation/global/models/breed_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BreedScreen extends StatelessWidget {
  late BreedModel breed;
  BreedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    breed = ModalRoute.of(context)!.settings.arguments as BreedModel;
    return Scaffold(
     body: BreedScreenProvide(
        breed: breed,
        size: size,
        data: {
          "Adaptability"   : breed.adaptability,
          "Affection"      : breed.affectionLevel,
          "Child Friendly" : breed.childFriendly,
          "Dog Friendly"   : breed.dogFriendly,
          "Energy Level"   : breed.energyLevel,
          "Health Issues"  : breed.healthIssues,
          "Socialneeds"    : breed.socialNeeds,
        },
        child: Column(
          children: [
            const HeaderBreed(),
            Expanded(
              child:  ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  children: [
                    SizedBox(height: size.height * 0.04,),
                    const InfoBreed(),
                    SizedBox(height: size.height * 0.05,),
                    SlideDownAnimation(
                      duration: const Duration(milliseconds: 500),
                      child: CustomText(
                        text: breed.name, 
                        textAlign: TextAlign.start, 
                        textSize: 20,
                        withBold: true,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    SlideDownAnimation(
                      duration: const Duration(milliseconds: 600),
                      child: CustomTextIcon(
                        image: "assets/images/ic_location.png",
                        text: breed.origin, 
                        textSize: 15,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    /* const SlideDownAnimation(
                      duration:  Duration(milliseconds: 650),
                      child:  */ Text(
                        /* text: */ "About", 
                        /* textAlign: TextAlign.start, 
                        textSize: 20,
                        withBold: true, */
                      ),
                   /*  ), */
                    SizedBox(height: size.height * 0.02,),
                    SlideDownAnimation(
                      duration: const Duration(milliseconds: 700),
                      child: CustomText(
                        text: breed.description, 
                        textAlign: TextAlign.justify, 
                        textSize: 15,
                        withOverflow: false,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    breed.wikipediaUrl != null? SlideDownAnimation(
                      duration: const Duration(milliseconds: 750),
                      child: InkWell(
                        onTap: () async{
                          if (!await launchUrl(Uri.parse(breed.wikipediaUrl!))) {
                            print('Could not launch ${breed.wikipediaUrl!}');
                          }
                        },
                        child: CustomText(
                          text: breed.wikipediaUrl!, 
                          textAlign: TextAlign.justify, 
                          textSize: 15,
                          color: Colors.blue,
                          withOverflow: false,
                        ),
                      ),
                    ) : const SizedBox(),
                    SizedBox(height: size.height * 0.05,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: const RatingInfo(),
                    )
                ],
              ),
            ),
          ],
        ),
     ),
    );
  }
}


class BreedScreenProvide extends InheritedWidget {
  final BreedModel breed;
  final Size size;
  final Map<String,dynamic> data;

  const BreedScreenProvide({
    required this.breed,
    required this.size,
    required this.data,
    required Widget child,
    Key? key
  }) : super(key: key,child: child);
  @override
  bool updateShouldNotify(BreedScreenProvide oldWidget) {
    return true;
  }

  static BreedScreenProvide of(BuildContext context)
   => context.dependOnInheritedWidgetOfExactType<BreedScreenProvide>()!;
  
}