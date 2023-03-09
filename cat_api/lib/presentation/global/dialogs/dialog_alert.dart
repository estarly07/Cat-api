import 'package:cat_api/presentation/global/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';


// ignore: slash_for_doc_comments
/**
 * @param buttons Structured button list => {"name":"name","onPressed": (){ } }
 */
showAlertDialogYesOrCancel(
  BuildContext context,
  String title,
  String content,
  Size size,
  List<Map<String, dynamic>> buttons,
  {bool dismissible = true}
) {
  List<Widget> actions = [];
  for (var button in buttons) {
    actions.add(TextButton(
    child: CustomText(
      text: button["name"], 
      color: Colors.blue, 
      textSize: size.height * 0.02,
      withBold: true,
      textAlign: TextAlign.left,
    ),
    onPressed: () => (button["onPressed"] as Function)(),
  ));
  }
  AlertDialog alert = AlertDialog(
    title: CustomText(text: title,  textSize: size.height * 0.025,withBold: true,textAlign: TextAlign.left), 
    content:CustomText(
      text: content, 
      color: Theme.of(context).colorScheme.secondary, 
      textSize: size.height * 0.02,
      textAlign: TextAlign.left,
      withOverflow: false,
    ), 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(size.width * 0.05))),
            contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.02),
    actions: actions,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  );
  showDialog(
    barrierDismissible: dismissible,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );  
}
