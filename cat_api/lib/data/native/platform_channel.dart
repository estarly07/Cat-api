import 'package:flutter/services.dart';

class PlatformChannel {
  final MethodChannel _methodChannel = const MethodChannel("app.cat_api/platfom_channel");
  Future changeLogoApk(bool changeApk)async{
    _methodChannel.invokeMethod("change_logo",{"changeApk":changeApk});
  }
}