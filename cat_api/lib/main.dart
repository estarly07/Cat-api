import 'package:cat_api/data/preferences/preferences.dart';
import 'package:cat_api/di/di.dart';
import 'package:cat_api/presentation/global/theme.dart';
import 'package:cat_api/presentation/global/theme_controller.dart';
import 'package:cat_api/presentation/home/blocs/breed/breed_bloc.dart';
import 'package:cat_api/presentation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_api/di/di.dart' as di;
import 'package:provider/provider.dart';
late final Preferences preferences;
void main() async{ 
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  preferences = Preferences.get;
  await preferences.initPreferences();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (_) => ThemeController())
      ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = context.watch();
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BreedBloc>(),),
      ],
      child:  MaterialApp(
          title: 'Material App',
          routes: routes(),
          theme: getTheme(themeController.darkMode),
          initialRoute: Screens.home,
        ),
    );
  }
}