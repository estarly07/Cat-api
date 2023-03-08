import 'package:cat_api/presentation/breed/ui/screen/breed_screen.dart';
import 'package:cat_api/presentation/home/ui/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes() => 
  {
    Screens.home : (context)  => const HomeScreen(),
    Screens.breed : (context) => BreedScreen()
  };


class Screens {
  static const home  = "home";
  static const breed = "breed";
  static navigationTo({
    required BuildContext context, 
    required String page, 
    required Object? arguments}
  ){
    Navigator.pushNamed(context, page,arguments: arguments);
  }
}