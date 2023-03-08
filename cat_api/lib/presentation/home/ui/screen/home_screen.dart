import 'package:cat_api/presentation/global/animations/animations.dart';
import 'package:cat_api/presentation/global/dialogs/breed_dialog.dart';
import 'package:cat_api/presentation/global/global_widgets/CustomText.dart';
import 'package:cat_api/presentation/global/global_widgets/custom_error.dart';
import 'package:cat_api/presentation/global/models/breed_model.dart';
import 'package:cat_api/presentation/global/theme_controller.dart';
import 'package:cat_api/presentation/home/blocs/breed/breed_bloc.dart';
import 'package:cat_api/presentation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:cat_api/presentation/home/ui/widgets/home_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showTitle = true;
  double halfScroll = 0;
  bool showFloatingUp = false;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    context.read<BreedBloc>().add(GetBreedsEvent());
    _controller.addListener(() {
      if(halfScroll ==0){
        halfScroll = (_controller.position.maxScrollExtent / 2);
        print("HALF $halfScroll");
      }
      if (_controller.position.pixels >= _controller.position.maxScrollExtent - 250) {
        context.read<BreedBloc>().add(GetMoreBreedsEvent());
      }
      if(_controller.position.pixels >= halfScroll){
        setState(() {
          showFloatingUp = true;
        });
      }else{
        setState(() {
          showFloatingUp = false;
        });
      }
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<BreedBloc, BreedState>(
        builder: (context, state) {
          return Stack(
            children: [
              ListView.builder(
                controller: _controller,
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
                            listenerSearch: (breed) { 
                              context.read<BreedBloc>().add(FilterBreedEvent(breed));
                              showTitle = breed.isEmpty;
                            },
                            onImageProfile: () {},
                            onTheme: () {
                              context.read<ThemeController>().onChageMode();
                            },
                            onMenu: () {},
                            searchEnabled: state is LoadedBreedState,
                            size: size,
                            showTitle: showTitle,
                            child: const HeaderHome()),
                        
                        state is LoadedBreedState && state.breeds.isEmpty? 
                          FadeInAnimation(
                            duration: const Duration(milliseconds: 300),
                            child: Lottie.asset("assets/animations/anim_empty.json"),
                          ): const SizedBox(),
                          
                        state is ErrorBreedState? 
                          FadeInAnimation(
                            duration: const Duration(milliseconds: 300),
                            child: CustomError(lottieAnimation: "assets/animations/anim_error.json",onRefresh: (){
                              context.read<BreedBloc>().add(GetBreedsEvent());
                            },),
                          ): const SizedBox(),
                        state is NoConnectionInternetState? 
                          FadeInAnimation(
                            duration: const Duration(milliseconds: 300),
                            child: CustomError(lottieAnimation: "assets/animations/anim_no_connection.json",onRefresh: (){
                              context.read<BreedBloc>().add(GetBreedsEvent());
                            },),
                          ): const SizedBox()
                      ],
                    );
                  } else {
                    return BreedItemProvider(
                      size : size,
                      wait : state is LoadingBreedState,
                      breed: state is LoadedBreedState? state.breeds[index-1] : null ,
                      onTapLongPress : (breed){
                        showDialog(context: context, builder: (_) => DialogBreed(
                          size: size,image:breed.referenceImageId,tagHero: breed.id,
                        ));
                      },
                      onTap:  (breed){ 
                        Screens.navigationTo(
                          context  : context, 
                          page     : Screens.breed, 
                          arguments: breed);
                      },
                      child: FadeInAnimation(
                        duration: Duration(milliseconds: 500),
                        delay: Duration(milliseconds: 100 +index),
                        child: const BreedItemHome()),
                    );
                  }
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Wrap(
                  children: [
                     showFloatingUp? _FloactingUp(size: size, onTap:(){
                       _controller.animateTo(
                          _controller.position.minScrollExtent,
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.fastOutSlowIn,
                        );
                     }) : const SizedBox(),
                    state is LoadedBreedState && state.loadingMoreBreads?
                        const _ProgresPagination(): const SizedBox(),
                  ],
                ),
              )
             
            ],
          );
        },
      ),
    );
  }
}

class _FloactingUp extends StatelessWidget {
  const _FloactingUp({
    Key? key,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
     alignment: Alignment.bottomRight,
     child: FadeInAnimation(
        delay: const Duration(milliseconds: 200),
        duration: const Duration(milliseconds: 500),
        child: Container(
         margin: EdgeInsets.only(right: size.width * 0.02,bottom: size.height * 0.02),
         child: FloatingActionButton.extended(
           backgroundColor: Colors.blue,
           label: const CustomText(text: "Up", textAlign: TextAlign.center, textSize: 15,withBold: true,),
           icon: const Icon(Icons.arrow_upward),
           onPressed: () => onTap()),
       ),
     ),
                    );
  }
}

class _ProgresPagination extends StatelessWidget {
  const _ProgresPagination({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        child: const CircularProgressIndicator(),
       ),
    );
  }
}

class HeaderHomeScreenProvider extends InheritedWidget {
  final Function(String) listenerSearch;
  final Function onMenu;
  final Function onTheme;
  final Function onImageProfile;
  final bool searchEnabled;
  final bool showTitle;
  final Size size;

  const HeaderHomeScreenProvider(
      {Key? key,
      required Widget child,
      required this.listenerSearch,
      required this.onMenu,
      required this.onTheme,
      required this.onImageProfile,
      required this.searchEnabled,
      required this.showTitle,
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