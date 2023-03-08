import 'package:cat_api/domain/validate_connection.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => ConnectHelper());
}