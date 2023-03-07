import 'package:cat_api/data/api/services/provide_dio.dart';
import 'package:get_it/get_it.dart';

void init(GetIt getIt){
  getIt.registerFactory(() => ProvideDio());
}