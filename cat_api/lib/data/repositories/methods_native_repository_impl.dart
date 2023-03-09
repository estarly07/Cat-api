import 'package:cat_api/data/native/platform_channel.dart';
import 'package:cat_api/domain/methods_native_repository.dart';

class MethodsNativeRepositoryImpl implements MethodsNativeRepository {
  final PlatformChannel _platformChannel;
  MethodsNativeRepositoryImpl(this._platformChannel);

  @override
  Future changeLogoApk(bool changeApk) async{
    _platformChannel.changeLogoApk(changeApk);
  }
  
}