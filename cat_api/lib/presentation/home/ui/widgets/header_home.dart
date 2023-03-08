import 'package:cat_api/presentation/global/animations/animations.dart';
import 'package:cat_api/presentation/global/global_widgets/global_widgets.dart';
import 'package:cat_api/presentation/global/theme_controller.dart';
import 'package:cat_api/presentation/home/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: HeaderHomeScreenProvider.of(context).size.height * 0.02,),
        const _TopHeader(),
        SizedBox(height: HeaderHomeScreenProvider.of(context).size.height * 0.07,),
        HeaderHomeScreenProvider.of(context).showTitle? 
        const SlideDownAnimation(
          duration: Duration(milliseconds: 700),
          child:  CustomText(
            textSize: 40,
            textAlign: TextAlign.left,
            text: "Find awesome \ncats", 
            withOverflow: false, 
            withBold: true
          ),
        ) : Container(),
        SizedBox(height: HeaderHomeScreenProvider.of(context).showTitle? HeaderHomeScreenProvider.of(context).size.height * 0.03 : 0,),
        const _Search(),
        SizedBox(height: HeaderHomeScreenProvider.of(context).size.height * 0.03,),
      ],
    );
  }
}

class _TopHeader extends StatelessWidget {
  const _TopHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SlideDownAnimation(
              duration: const Duration(milliseconds: 500),
              child: InkWell(
                onTap: () => HeaderHomeScreenProvider.of(context).onMenu(),
                child: SvgPicture.asset("assets/svg/ic_menu.svg",color: Theme.of(context).primaryColor,),
              ),
            ),
            const SizedBox(width: 10,),
            SlideDownAnimation(
              duration: const Duration(milliseconds: 500),
              child: InkWell(
                onTap: () => HeaderHomeScreenProvider.of(context).onTheme(),
                child: Image.asset(
                   context.read<ThemeController>().darkMode?  
                      "assets/images/ic_sun.png":
                      "assets/images/ic_moon.png",
                   height: 25,
                ),
              ),
            ),
          ],
        ),
        
        SlideDownAnimation(
          duration: const Duration(milliseconds: 500),
          child: InkWell(
            onTap: () => HeaderHomeScreenProvider.of(context).onMenu(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                width: 50,
                height: 50,
                placeholder: AssetImage("assets/images/no_image.jpg"), 
                fit: BoxFit.cover,
                imageErrorBuilder: (context, url, error) => 
                  Image.asset("assets/images/no_image.jpg",  width: 50,height: 50,),
                image: NetworkImage("https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80")
              ),
            )),
        ),
      ],
    );
  }
}

class _Search extends StatefulWidget {
  const _Search({
    Key? key
  }) : super(key: key);

  @override
  State<_Search> createState() => _SearchState();
}

class _SearchState extends State<_Search> {
   TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller.addListener(() { 
      HeaderHomeScreenProvider.of(context).listenerSearch(_controller.text);
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      duration: const Duration(milliseconds: 800),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400,width: 2),
          borderRadius: BorderRadius.circular(
            HeaderHomeScreenProvider.of(context).size.height
          )
        ),
        child: TextField(
          enabled: HeaderHomeScreenProvider.of(context).searchEnabled,
          controller   : _controller,
          keyboardType : TextInputType.text,
          textInputAction: TextInputAction.done,
          autofocus    : false,
          maxLines     : 1,
          decoration :  InputDecoration(
            hintText   : "Search cat...",
            border     : InputBorder.none,
            prefixIcon : Icon(Icons.search,color: Theme.of(context).colorScheme.secondary,),
            labelStyle : TextStyle(color:  Theme.of(context).colorScheme.secondary,  fontSize: 15),
        )),
      ),
    );
  }
}