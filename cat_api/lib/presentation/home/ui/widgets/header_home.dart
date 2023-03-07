import 'package:cat_api/presentation/global_widgets/CustomText.dart';
import 'package:cat_api/presentation/home/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: HomeScreenProvider.of(context).size.height * 0.02,),
        const _TopHeader(),
        SizedBox(height: HomeScreenProvider.of(context).size.height * 0.07,),
        const CustomText(
          textSize: 40,
          textAlign: TextAlign.left,
          text: "Find awesome \ncats", 
          color: Colors.black, 
          withOverflow: false, 
          withBold: true
        ),
        SizedBox(height: HomeScreenProvider.of(context).size.height * 0.03,),
        const _Search(),
        SizedBox(height: HomeScreenProvider.of(context).size.height * 0.03,),
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
        InkWell(
          onTap: () => HomeScreenProvider.of(context).onMenu(),
          child: SvgPicture.asset("assets/svg/ic_menu.svg"),
        ),
        InkWell(
          onTap: () => HomeScreenProvider.of(context).onMenu(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              width: 50,
              height: 50,
              placeholder: AssetImage("assets/images/no_image.jpg"), 
              fit: BoxFit.cover,
              image: NetworkImage("https://i.pinimg.com/originals/5a/20/2d/5a202d78a6df325fe1edeb245fda62f6.png")
            ),
          )),
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
      HomeScreenProvider.of(context).listenerSearch(_controller.text);
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400,width: 2),
        borderRadius: BorderRadius.circular(
          HomeScreenProvider.of(context).size.height
        )
      ),
      child: TextField(
        enabled: HomeScreenProvider.of(context).searchEnabled,
        controller   : _controller,
        keyboardType : TextInputType.text,
        textInputAction: TextInputAction.done,
        autofocus    : false,
        maxLines     : 1,
        decoration : InputDecoration(
          hintText   : "Search cat...",
          border     : InputBorder.none,
          prefixIcon : Icon(Icons.search,color: Colors.grey.shade400,),
          labelStyle : TextStyle(color: Colors.grey.shade400,  fontSize: 15),
      )),
    );
  }
}