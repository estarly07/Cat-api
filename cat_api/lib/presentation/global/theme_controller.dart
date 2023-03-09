import 'package:cat_api/data/preferences/preferences.dart';
import 'package:cat_api/domain/methods_native_repository.dart';
import 'package:flutter/cupertino.dart';

class ThemeController extends ChangeNotifier {
  late bool _darkMode; 
  final MethodsNativeRepository _methodsNativeRepository;
  ThemeController(this._methodsNativeRepository){
    _darkMode = Preferences.get.theme;
  }
  bool get darkMode => _darkMode;
  
  void onChageMode(){
    _darkMode = !darkMode;
    Preferences.get.theme = _darkMode;
    notifyListeners();
  }
  void onChageIcon(){
    _methodsNativeRepository.changeLogoApk(Preferences.get.theme);
  }
}