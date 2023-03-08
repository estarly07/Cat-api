import 'package:cat_api/di/di.dart';
import 'package:cat_api/presentation/global/theme.dart';
import 'package:cat_api/presentation/global/theme_controller.dart';
import 'package:cat_api/presentation/home/blocs/breed/breed_bloc.dart';
import 'package:cat_api/presentation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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