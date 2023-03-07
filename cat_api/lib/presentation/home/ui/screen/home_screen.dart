import 'package:cat_api/presentation/global/dialogs/breed_dialog.dart';
import 'package:cat_api/presentation/global/models/breed_model.dart';
import 'package:cat_api/presentation/home/blocs/breed/breed_bloc.dart';
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
  void initState() {
     print("object");
    context.read<BreedBloc>().add(GetBreedsEvent());
    super.initState();
  }
  @override
  void didChangeDependencies() {
 /*    print("object");
    context.read<BreedBloc>().add(GetBreedsEvent()); */
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
                    HeaderHomeScreenProvider(
                        listenerSearch: (breed) { context.read<BreedBloc>().add(FilterBreedEvent(breed));},
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
                return BreedItemProvider(
                  size : size,
                  wait : state is LoadingBreedState,
                  breed: state is LoadedBreedState? state.breeds[index-1] : null ,
                  onTapLongPress : (breed){
                    showDialog(context: context, builder: (_) => DialogBreed(size: size,image:breed.referenceImageId,));
                  },
                  onTap:  (breed){ },
                  child: const BreedItemHome(),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class HeaderHomeScreenProvider extends InheritedWidget {
  final Function(String) listenerSearch;
  final Function onMenu;
  final Function onImageProfile;
  final bool searchEnabled;
  final Size size;

  const HeaderHomeScreenProvider(
      {Key? key,
      required Widget child,
      required this.listenerSearch,
      required this.onMenu,
      required this.onImageProfile,
      required this.searchEnabled,
      required this.size})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(HeaderHomeScreenProvider oldWidget) {
    return true;
  }

  static HeaderHomeScreenProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HeaderHomeScreenProvider>()!;
}
class BreedItemProvider extends InheritedWidget {
  final Size size;
  final bool wait;
  final BreedModel? breed;
  final Function(BreedModel) onTap;
  final Function(BreedModel) onTapLongPress;

  const BreedItemProvider({
    Key? key,
    required this.size, 
    required this.wait, 
    required this.breed, 
    required this.onTap, 
    required this.onTapLongPress,
    required Widget child
  }) 
    : super(child: child,key: key);
  @override
  bool updateShouldNotify(BreedItemProvider oldWidget) {
    return true;
  }
   static BreedItemProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<BreedItemProvider>()!;
}