import 'package:flutter/material.dart';
import 'package:cat_api/presentation/home/ui/widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list =["","","","","","","",""];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left : size.width * 0.05,
          right: size.width * 0.05,
          top  : size.height *0.05
        ),
        itemCount: list.length + 1,// the one is to display the header
        itemBuilder: (context, index) {
          if(index == 0){
            return HomeScreenProvider(
              listenerSearch : (text){},
              onImageProfile : (){},
              onMenu         : (){},
              searchEnabled  : true,
              size           : size,
              child          : const HeaderHome()
            );
          }else{
            return BreedItemHome(size: size,);
          }
        },
      ),
    );
  }
}

class HomeScreenProvider extends InheritedWidget {
  final Function(String) listenerSearch;
  final Function onMenu;
  final Function onImageProfile;
  final bool searchEnabled;
  final Size size;

  const HomeScreenProvider({
    Key? key,
    required Widget child,
    required this.listenerSearch, 
    required this.onMenu, 
    required this.onImageProfile, 
    required this.searchEnabled, 
    required this.size
  }) : super(key: key,child: child);


  @override
  bool updateShouldNotify( HomeScreenProvider oldWidget) {
    return true;
  }
  static HomeScreenProvider of(BuildContext context) 
    => context.dependOnInheritedWidgetOfExactType<HomeScreenProvider>()!;
  
}