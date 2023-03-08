import 'package:cat_api/data/preferences/preferences.dart';
import 'package:flutter/cupertino.dart';

class ThemeController extends ChangeNotifier {
  late bool _darkMode; 
  ThemeController(){
    _darkMode = Preferences.get.theme;
  }
  bool get darkMode => _darkMode;
  
  void onChageMode(){
    _darkMode = !darkMode;
    Preferences.get.theme = _darkMode;
    notifyListeners();
  }
}