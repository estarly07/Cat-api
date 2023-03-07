import 'package:cat_api/presentation/home/blocs/bloc/breed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cat_api/presentation/home/ui/widgets/home_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    context.read<BreedBloc>().add(GetBreedsEvent());
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<BreedBloc, BreedState>(
        builder: (context, state) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                top: size.height * 0.05),
            itemCount: state is LoadedBreedState? 
                          (state).breeds.length + 1 : // the one is to display the header
                          state is LoadingBreedState? 10 : 1, 
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    HomeScreenProvider(
                        listenerSearch: (text) {},
                        onImageProfile: () {},
                        onMenu: () {},
                        searchEnabled: true,
                        size: size,
                        child: const HeaderHome()),
                    
                    state is LoadedBreedState && state.breeds.isEmpty? 
                      Image.asset(
                        "assets/images/no_image.jpg"
                      ): const SizedBox(),
                      
                    state is ErrorBreedState? 
                      Image.asset(
                        "assets/images/no_image.jpg"
                      ): const SizedBox()
                  ],
                );
              } else {
                return BreedItemHome(
                  size : size,
                  wait : state is LoadingBreedState,
                  breed: state is LoadedBreedState? state.breeds[index-1] : null 
                );
              }
            },
          );
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

  const HomeScreenProvider(
      {Key? key,
      required Widget child,
      required this.listenerSearch,
      required this.onMenu,
      required this.onImageProfile,
      required this.searchEnabled,
      required this.size})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(HomeScreenProvider oldWidget) {
    return true;
  }

  static HomeScreenProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeScreenProvider>()!;
}
