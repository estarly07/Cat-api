import 'package:get_it/get_it.dart';

import 'package:cat_api/di/blocs_module.dart'     as diBlocs;
import 'package:cat_api/di/uses_case_module.dart' as diUsescases;


final getIt = GetIt.instance;
void init(){
  diUsescases.init(getIt);
  diBlocs    .init(getIt);
}