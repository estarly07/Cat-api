import 'package:get_it/get_it.dart';

import 'package:cat_api/di/blocs_module.dart'        as diBlocs;
import 'package:cat_api/di/uses_case_module.dart'    as diUsescases;
import 'package:cat_api/di/repositories_module.dart' as diRepositories;
import 'package:cat_api/di/services_module.dart'     as diServices;
import 'package:cat_api/di/dio_module.dart'          as diDio;


final getIt = GetIt.instance;
void init(){
  diUsescases   .init(getIt);
  diBlocs       .init(getIt);
  diRepositories.init(getIt);
  diServices    .init(getIt);
  diDio         .init(getIt);
}