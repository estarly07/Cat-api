import 'package:cat_api/data/preferences/preferences.dart';
import 'package:cat_api/di/di.dart' as di;
import 'package:cat_api/flavors.dart';
import 'package:cat_api/presentation/my_app.dart';
import 'package:cat_api/presentation/global/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
late final Preferences preferences;
void main() async{ 
  Flavor.flavor = Flavors.qa;//init configuration flavor
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  preferences = Preferences.get;
  await preferences.initPreferences();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (_) => ThemeController())
      ],
      child: const MyApp()));
}