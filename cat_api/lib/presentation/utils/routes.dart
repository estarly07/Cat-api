import 'package:cat_api/presentation/home/ui/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routes() => 
  {
    Screens.home : (context) => const HomeScreen()
  };


class Screens {
  static const home = "home";
  
}