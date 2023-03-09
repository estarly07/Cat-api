import 'package:cat_api/data/api/services/breed_service.dart';
import 'package:cat_api/data/native/platform_channel.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => PlatformChannel());
}