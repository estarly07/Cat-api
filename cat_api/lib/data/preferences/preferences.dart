import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  List<String> keys = ["theme"];
  static final get  = Preferences._();
  Preferences._();


  late SharedPreferences _sharedPreferences;
  initPreferences () async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  set theme(bool theme) => _sharedPreferences.setBool(keys[0], theme);
  bool get theme => _sharedPreferences.getBool(keys[0]) ?? false;

}